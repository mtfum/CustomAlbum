//
//  CustomAlbum.swift
//  CustomAlbum
//
//  Created by Fumiya Yamanaka on 2019/11/03.
//  Copyright © 2019 mtfum. All rights reserved.
//

import UIKit
import Photos

open class CustomAlbum {

  public static let shared = CustomAlbum()

  private let name: String

  public init() {
    self.name = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
  }

  public func save(image: UIImage, completion: @escaping (Result<PHAsset, Swift.Error>) -> Void) {
    confirmAssetCollection() { [weak self] collection in
      self?.saveInAlbum(for: .image(image), at: collection, completion: completion)
    }
  }

  public func save(at movieURL: URL, completion: @escaping (Result<PHAsset, Swift.Error>) -> Void) {
    confirmAssetCollection() { [weak self] collection in
      self?.saveInAlbum(for: .movie(movieURL), at: collection, completion: completion)
    }
  }

  private func confirmAssetCollection(completion: @escaping (PHAssetCollection?) -> Void) {

    func fetchAssetCollectionForAlbum() -> PHAssetCollection? {
      let fetchOptions = PHFetchOptions()
      fetchOptions.predicate = NSPredicate(format: "title == %@", name)
      let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
      return collection.firstObject
    }

    if let assetCollection = fetchAssetCollectionForAlbum() {
      completion(assetCollection)
    } else {
      PHPhotoLibrary.shared().performChanges({
        PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: self.name)
      }) { success, _ in
        if success {
          completion(fetchAssetCollectionForAlbum())
        } else {
          assertionFailure()
        }
      }
    }
  }

  private func saveInAlbum(
    for asset: AssetChangeRequestType,
    at collection: PHAssetCollection?,
    completion: @escaping (Result<PHAsset, Swift.Error>) -> Void) {

    guard let album = collection else {
      completion(.failure(Error.noAssetCollection))
      return
    }

    var placeholder: PHObjectPlaceholder?
    PHPhotoLibrary.shared().performChanges({
      let assetChangeRequest: PHAssetChangeRequest?
      switch asset {
      case .image(let image):
        assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
      case .movie(let url):
        assetChangeRequest = PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: url)
      }
      guard let albumChangeRequest = PHAssetCollectionChangeRequest(for: album),
        let assetPlaceholder = assetChangeRequest?.placeholderForCreatedAsset else {
          completion(.failure(Error.noAssetPlaceholder))
          return
      }
      placeholder = assetPlaceholder
      let fastEnumration = NSArray(array: [assetPlaceholder])
      albumChangeRequest.addAssets(fastEnumration)
    }) { success, error in
      if let e = error {
        completion(.failure(e))
      } else {
        guard success, let placeholder = placeholder else {
          completion(.failure(Error.noAssetPlaceholder))
          return
        }
        let assets = PHAsset.fetchAssets(withLocalIdentifiers: [placeholder.localIdentifier], options: nil)
        if let asset = assets.firstObject {
          completion(.success(asset))
        } else {
          completion(.failure(Error.noAsset))
        }
      }
    }
  }

  public enum Error: Swift.Error {
    case noAsset
    case noAssetCollection
    case noAssetPlaceholder
  }

  private enum AssetChangeRequestType {
    case image(UIImage)
    case movie(URL)
  }
}


//
//  AppDelegate.swift
//  CustomAlbumDemo
//
//  Created by Fumiya Yamanaka on 2019/11/05.
//

import UIKit
import Photos

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    if PHPhotoLibrary.authorizationStatus() != .authorized {
      PHPhotoLibrary.requestAuthorization { _ in }
    }

    return true
  }
}


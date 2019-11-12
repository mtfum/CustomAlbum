//
//  ImagePicker.swift
//  CustomAlbumDemo
//
//  Created by Fumiya Yamanaka on 2019/11/12.
//

import SwiftUI

final class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

  @Binding private var isShown: Bool
  @Binding private var image: UIImage?

  init(isShown: Binding<Bool>, image: Binding<UIImage?>) {
    _isShown = isShown
    _image = image
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
    image = uiImage
    isShown = false
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    isShown = false
  }
}

struct ImagePicker: UIViewControllerRepresentable {

  @Binding var isShown: Bool
  @Binding var image: UIImage?

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
  }

  func makeCoordinator() -> ImagePickerCoordinator {
    ImagePickerCoordinator(isShown: $isShown, image: $image)
  }

  func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    return picker
  }
}

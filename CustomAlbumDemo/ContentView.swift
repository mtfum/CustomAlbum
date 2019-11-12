//
//  ContentView.swift
//  CustomAlbumDemo
//
//  Created by Fumiya Yamanaka on 2019/11/05.
//

import SwiftUI
import CustomAlbum

struct ContentView: View {

  @State private var showImagePicker = false
  @State private var showSuccessAlert = false
  @State private var uiImage: UIImage?

  private let albumName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as! String

  var body: some View {
    VStack(spacing: 20) {

      uiImage != nil
        ? ViewBuilder.buildEither(first: Image(uiImage: uiImage!)
          .resizable()
          .scaledToFit())
        : ViewBuilder.buildEither(second: Text(String("Select Image!")))

      Button(action: {
        self.showImagePicker = true
      }, label: {
        Text(String("Open ImagePicker"))
          .modifier(GreenButton())
      })

      Button(action: {
        guard let image = self.uiImage  else { return }
        CustomAlbum.shared.save(image) { result in
          switch result {
          case .success:
            self.showSuccessAlert = true
          case .failure:
            break
          }
        }
      }, label: {
        Text(String("Save Image to \(albumName)"))
          .modifier(GreenButton())
      })
        .alert(isPresented: self.$showSuccessAlert) {
          return Alert(title: Text(String("Saved Image to \(albumName)!")),
                message: nil,
                dismissButton: Alert.Button.default(Text(String("Close"))))
      }
    }
    .sheet(isPresented: $showImagePicker) {
      ImagePicker(isShown: self.$showImagePicker, image: self.$uiImage)
    }
  }
}

struct GreenButton: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding()
      .background(Color.green)
      .foregroundColor(.white)
      .cornerRadius(10)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

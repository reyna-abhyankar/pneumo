//
//  ContentView.swift
//  CameraAndGalleryTutorial
//
//  Created by Duy Bui on 10/26/19.
//  Copyright © 2019 Duy Bui. All rights reserved.
//

import SwiftUI

struct CaptureImageView {
  
  /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: UIImage?
    //@Binding var enabled: Bool
  
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown,
                           image: $image)//,
                           //enabled: $enabled)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        /// Default is images gallery. Un-comment the next line of code if you would like to test camera
        //    picker.sourceType = .camera
        return picker
    }
  
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                              context: UIViewControllerRepresentableContext<CaptureImageView>) {

    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

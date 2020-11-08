//
//  Coordinator.swift
//  CameraAndGalleryTutorial
//
//  Created by Duy Bui on 10/26/19.
//  Copyright © 2019 Duy Bui. All rights reserved.
//

import SwiftUI

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var isCoordinatorShown: Bool
    @Binding var imageInCoordinator: UIImage?
    //@Binding var diagnosisEnabled: Bool
    
    init(isShown: Binding<Bool>, image: Binding<UIImage?>) { //}, enabled: Binding<Bool>) {
        _isCoordinatorShown = isShown
        _imageInCoordinator = image
        //_diagnosisEnabled = enabled
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("Nil")
            return
        }
        imageInCoordinator = unwrapImage
        print(imageInCoordinator)
        //diagnosisEnabled = true
        isCoordinatorShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isCoordinatorShown = false
    }
}

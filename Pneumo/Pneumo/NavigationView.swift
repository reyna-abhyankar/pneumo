//
//  Navigation.swift
//  Pneumo
//
//  Created by Alice Chien on 7/5/20.
//  Copyright © 2020 Alice Chien. All rights reserved.
//

import SwiftUI

struct Navigation: View {
    @State var showActionSheet = false
    @State var showImagePicker = false
    
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State var image: UIImage? = nil
    @State var showCaptureImageView: Bool = false
    
    let buttons = [WelcomeButtons(imageName: "camera.viewfinder",
                                  text: "SCAN"),
                   WelcomeButtons(imageName: "icloud.and.arrow.up",
                                  text: "UPLOAD"),
                   WelcomeButtons(imageName: "archivebox",
                                  text: "LIBRARY")]
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 30) {
                Text("HOME")
                    .font(.system(size: 50))
                    .fontWeight(.thin)
                    .foregroundColor(Color.gray)
                    //.offset(y:-30)
                
                Button(action: {
                    self.showActionSheet = true
                }) {
                    Text("Show Image Picker")
                }.actionSheet(isPresented: $showActionSheet){
                    ActionSheet(title: Text("Add a picture to your post"), message: nil, buttons: [
                        //Button1
                        
                        .default(Text("Camera"), action: {
                            self.showImagePicker = true
                            self.sourceType = .camera
                        }),
                        //Button2
                        .default(Text("Photo Library"), action: {
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                        }),
                        
                        //Button3
                        .cancel()
                        
                    ])
                }.sheet(isPresented: $showImagePicker){
                    imagePicker(image: self.$image, showImagePicker: self.$showImagePicker, sourceType: self.sourceType)
                    
                }
            }
                /*ForEach(buttons, id: \.id) { button in
                    NavigationLink(destination: {
                            VStack {
                                if button.text=="LIBRARY" {
                                    Library()
                                } else {
                                    DetailView()
                                        //.navigationBarHidden(true)
                                        //.navigationBarTitle("")
                                }
                            }
                        }()) {
                        VStack {
                            //Button(action: {}) {
                            //    VStack {
                            Image(systemName: button.imageName)
                                .padding(40)
                                .font(.system(size: 65, weight: .thin))
                                .foregroundColor(Color("DarkShade"))
                                .overlay(Circle().stroke(Color("DarkShade"), lineWidth: 2))
                            Text("\(button.text)")
                                .foregroundColor(Color.gray)
                                //.foregroundColor(Color.purple)
                                }
                           // }
                        //}
                    }
                }*/
            //}.offset(y:-40)

        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

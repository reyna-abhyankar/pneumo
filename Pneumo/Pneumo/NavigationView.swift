//
//  Navigation.swift
//  Pneumo
//
//  Created by Alice Chien on 7/5/20.
//  Copyright © 2020 Alice Chien. All rights reserved.
//

import SwiftUI

struct Navigation: View {
    @State var showingAbout: Bool = false
    @State var showCaptureImageView: Bool = false
    @State private var image: UIImage? = nil
    let buttons = [WelcomeButtons(imageName: "camera.viewfinder",
                                  text: "SCAN"),
                   WelcomeButtons(imageName: "doc.on.clipboard",
                                  text: "CURB-65"),
                   WelcomeButtons(imageName: "person.fill",
                                  text: "PATIENTS")]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                HStack {
                    Spacer()
                    Text("HOME")
                        .font(.system(size: 50))
                        .fontWeight(.thin)
                        .foregroundColor(Color.gray)
                        .frame(width: 150, height: 50, alignment: .center)
                        .padding(.leading, 40)
                    Spacer()
                    Button(action: {
                        self.showingAbout.toggle()
                    }) {
                        Image(systemName: "info.circle")
                            .font(.system(size: 30, weight: .thin))
                            .frame(width: 30, height: 30, alignment: .trailing)
                            .padding(.trailing)
                    }.sheet(isPresented: $showingAbout) {
                        AboutPage(showAbout: self.$showingAbout)
                    }
                }
                
                Button(action: {
                    self.showCaptureImageView.toggle()
                }, label: {
                    CustomButton(name: buttons[0].imageName,
                                 text: buttons[0].text)
                })
                
                ForEach(1..<buttons.count) { num in
                    NavigationLink(destination: {
                        VStack {
                            if buttons[num].text=="CURB-65" {
                                Curb65()
                            } else {
                                Library()
                            }
                        }
                    }()) {
                        CustomButton(name: buttons[num].imageName,
                                     text: buttons[num].text)
                    }
                }
            }.offset(y:-50)
            .sheet(isPresented: $showCaptureImageView) {
                CaptureImageView(isShown: self.$showCaptureImageView,
                                 image: self.$image)
                    .onDisappear(perform: self.check)
            }

        }
    }
    
    func check() {
        print("Done")
    }
}

struct CustomButton: View {
    let name: String
    let text: String
    var body: some View {
        VStack {
            Image(systemName: name)
                .padding(40)
                .font(.system(size: 65, weight: .thin))
                .foregroundColor(Color("DarkShade"))
                .overlay(Circle().stroke(Color("DarkShade"), lineWidth: 2))
            Text(text)
                .foregroundColor(Color.gray)
                //.foregroundColor(Color.purple)
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

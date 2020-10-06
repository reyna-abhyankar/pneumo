//
//  Navigation.swift
//  Pneumo
//
//  Created by Alice Chien on 7/5/20.
//  Copyright © 2020 Alice Chien. All rights reserved.
//

import SwiftUI

struct Navigation: View {
    @State var showingAbout = false
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
                        AboutPage()
                    }
                }

                ForEach(buttons, id: \.id) { button in
                    NavigationLink(destination: {
                            VStack {
                                if button.text=="MY SCANS" {
                                    Library()
                                } else if button.text=="CURB-65" {
                                    Curb65()
                                } else {
                                    Library()
                                }
                            }
                        }()) {
                        VStack {
                            Image(systemName: button.imageName)
                                .padding(40)
                                .font(.system(size: 65, weight: .thin))
                                .foregroundColor(Color("DarkShade"))
                                .overlay(Circle().stroke(Color("DarkShade"), lineWidth: 2))
                            Text("\(button.text)")
                                .foregroundColor(Color.gray)
                                //.foregroundColor(Color.purple)
                        }
                    }
                }
            }.offset(y:-50)

        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

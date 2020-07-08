//
//  Navigation.swift
//  Swift UI Practice 2
//
//  Created by Alice Chien on 7/5/20.
//  Copyright © 2020 Alice Chien. All rights reserved.
//

import SwiftUI

struct WelcomeButtons: Identifiable {
    var id = UUID()
    var imageName: String
    var text: String
}

struct Navigation: View {
    let buttons = [WelcomeButtons(imageName: "camera.viewfinder",
                                  text: "SCAN"),
                   WelcomeButtons(imageName: "icloud.and.arrow.up",
                                  text: "UPLOAD"),
                   WelcomeButtons(imageName: "archivebox",
                                  text: "LIBRARY")]
    
    var body: some View {
        VStack(spacing: 30){
            Text("WELCOME")
                       .font(.system(size: 50))
                       .fontWeight(.ultraLight)
                       .offset(y:-30)
            
            ForEach(buttons, id: \.id) { button in
                Button(action: {}) {
                    VStack {
                        Image(systemName: button.imageName)
                            .padding(40)
                            .font(.system(size: 60, weight: .thin))
                            .foregroundColor(.gray)
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        Text("\(button.text)")
                            .foregroundColor(Color.purple)
                    }
                }
            }
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

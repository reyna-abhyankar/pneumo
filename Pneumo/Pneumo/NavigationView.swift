//
//  Navigation.swift
//  Swift UI Practice 2
//
//  Created by Alice Chien on 7/5/20.
//  Copyright © 2020 Alice Chien. All rights reserved.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        //VStack {
            
            
            VStack(spacing: 40){
                Text("WELCOME")
                    .font(.system(size: 50))
                .fontWeight(.ultraLight)
                .offset(y:-30)
                
                Button(action: {}) {
                    VStack {
                        Image(systemName: "camera.viewfinder")
                        .padding(35)
                        .font(.system(size: 70, weight: .thin))
                        .foregroundColor(.gray)
                        .overlay(
                            Circle()
                                .stroke(Color.gray, lineWidth: 2))
                        Text("SCAN")
                        .foregroundColor(Color.purple)
                    }
                }
                
                Button(action: {}) {
                    VStack {
                        Image(systemName: "icloud.and.arrow.up")
                        .padding(40)
                        .font(.system(size: 60, weight: .thin))
                        .foregroundColor(.gray)
                        .overlay(
                            Circle()
                                .stroke(Color.gray, lineWidth: 2))
                        Text("UPLOAD")
                            .foregroundColor(Color.purple)
                    }
                }
               
                Button(action: {}) {
                    VStack {
                       Image(systemName: "archivebox")
                       .padding(40)
                       .font(.system(size: 60, weight: .thin))
                       .foregroundColor(.gray)
                       .overlay(
                           Circle()
                               .stroke(Color.gray, lineWidth: 2))
                       Text("LIBRARY")
                            .foregroundColor(Color.purple)
                    }
              }
                  
          }
        }
    //}
}
    

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

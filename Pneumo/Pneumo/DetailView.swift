//
//  DetailView.swift
//  Pneumo
//
//  Created by Viren Abhyankar on 7/8/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State var image: Image? = nil
    //@State var showCaptureImageView: Bool = false
  
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    //self.showCaptureImageView = true
                }) {
                    Text("Choose photos")
                }
                image?.resizable()
                  .frame(width: 250, height: 200)
                  .clipShape(Circle())
                  .overlay(Circle().stroke(Color.white, lineWidth: 4))
                  .shadow(radius: 10)
            }
            /*if (showCaptureImageView) {
                CaptureImageView(isShown: $showCaptureImageView,
                                 image: $image)
            }*/
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

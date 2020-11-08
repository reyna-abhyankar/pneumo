//
//  AnalyticsView.swift
//  Pneumo
//
//  Created by Alice Chien on 8/22/20.
//  Copyright © 2020 Alice Chien. All rights reserved.
//

import SwiftUI

struct AnalyticsView: View {
    @Binding var showView: Bool
    @Binding var image: UIImage?
    var body: some View {
        VStack(spacing: 80) {
            VStack {
                Image(uiImage: (image ?? UIImage(named:"P4"))!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280, height: 270)
                    .border(Color.gray, width:0)
                    .offset(y: 35)
                Text("PNEUMONIA DETECTED")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(Color("DarkShade"))
                    .multilineTextAlignment(.center)
                    .offset(y: 40)
            }
            HStack(spacing: 8) {
                Image("P5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.black, lineWidth: 2)
                )
                VStack {
                    Text("Covid-Induced")
                        .font(.headline)
                        .padding(5)
                    Text("Prognosis Accuracy: 93%")
                        .padding(5)
                        .offset(x: 8)
                }
            }.offset(y: -10)
            VStack {
                Text("Additional Results:")
                    .padding(5)
                    .font(.headline)
                Text("Community-Aquired: 9%")
                    .padding(5)
                Text("No Pneumonia: 3%")
                    .padding(5)
            }.offset(y: -30)
            HStack {
                Text("Treatment Plans")
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color("Accent2"))
                    .cornerRadius(100)
                Text("Save to Patient")
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color("Accent2"))
                    .cornerRadius(100)
            }.offset(y: -50)
        }
        .padding()
        .navigationBarTitle("Results")
        .onDisappear(perform: {
            self.showView = false
            self.image = nil
        })
    }
    
}

/*
struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
 */

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

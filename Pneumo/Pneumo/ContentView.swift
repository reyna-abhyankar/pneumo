//
//  ContentView.swift
//  Swift UI Practice 2
//
//  Created by Alice Chien on 7/3/20.
//  Copyright © 2020 Alice Chien. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color.init(red: 119/255, green: 88/255, blue: 245/255, opacity: 100)
                .edgesIgnoringSafeArea(.all)
           
            VStack {
                LungLogo()
                                
                Text("PNEUMO")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.white)
            }
                
                
        }
    }
}
struct LungLogo: View {
    var body: some View {
        ZStack {
            Circle()
            .fill(Color.white).frame(width: 175, height: 175)
            .opacity(0.97)
            
            Image("lungs")
            .resizable()
                .frame(width: 125.0, height: 140.0)
                
        
        
        
        }
        
    
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

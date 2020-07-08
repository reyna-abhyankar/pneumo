//
//  Onboarding.swift
//  Pneumo
//
//  Created by Alice Chien on 7/8/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct Onboarding: View {
    
    @State private var step = 1
    
    var body: some View {
        ZStack {
            Color("DarkShade")
                .edgesIgnoringSafeArea(.all)
            
            //Rectangle()
                //.fill(Color("Accent2"))
                //.scaleEffect(1.4)
                //.rotationEffect(.degrees(-15))
                //.offset(x: -100, y: 300)
            
            VStack(spacing: 15) {
                Text("Welcome to")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .foregroundColor(Color("LightShade"))
                    .padding(.top)
                Text("PNEUMO")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .bold()
                    .foregroundColor(Color("LightShade"))
                
                GeometryReader { gr in
                    HStack {
                        VStack(spacing: 40) {
                            Image("P1").resizable().frame(width: 400, height: 250)
                            Text("Make pneumonia radiology analysis simple with our mobile app.")
                                .font(.title)
                                .fontWeight(.thin)
                                .multilineTextAlignment(.center)
                                .padding()
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Image("P1").resizable().frame(width: 400, height: 250)
                            Text("Scan or upload chest x-rays, and our algorithms will provide differential pneumonia diagnoses.")
                                .fontWeight(.thin)
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Image("P1").resizable().frame(width: 400, height: 250)
                            Text("Before proceeding, please remember that PNEUMO is not 100% accurate. Always consult with a physician.")
                                .fontWeight(.thin)
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                        
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("LightShade"))
                    .font(.title)
                    .padding(.vertical, 60).frame(width: gr.frame(in: .global).width * 3)
                    .frame(maxHeight: .infinity).offset(x: self.step == 1 ? gr.frame(in: .global).width : self.step == 2 ? 0 : -gr.frame(in: .global).width)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                }
                HStack(spacing: 20) {
                    Button(action: {self.step = 1}) {
                        Image(systemName: "1.circle")
                            .padding()
                            .scaleEffect(step == 1 ? 1 : 0.65)
                            //.background(Circle()
                                //.fill(Color("Accent"))
                                //.shadow(radius: 10))
                    }
                    Button(action: {self.step = 2}) {
                        Image(systemName: "2.circle")
                            .padding()
                            .scaleEffect(step == 2 ? 1 : 0.65)
                            //.background(Circle()
                                //.fill(Color("Accent"))
                                //.shadow(radius: 10))
                    }
                    Button(action: {self.step = 3}) {
                        Image(systemName: "3.circle")
                            .padding()
                            .scaleEffect(step == 3 ? 1 : 0.65)
                            //.background(Circle()
                                //.fill(Color("Accent"))
                                //.shadow(radius: 10))
                        }
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.5))
                .font(.largeTitle)
                .accentColor(Color("LightAccent"))
                
                Button(action: {}) {
                    HStack {
                        Text("Continue")
                        Image(systemName: "chevron.right")
                    }
                    .padding(.horizontal)
                    .padding()
                    .background(Capsule()
                    .fill(Color("Accent2")))
                    .accentColor(Color("LightAccent"))
                    .opacity(step == 3 ? 1 : 0)
                    .animation(.none).scaleEffect(step == 3 ? 1 : 0.01).animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10))
                }
            }
            
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

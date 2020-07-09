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
    
    let onboardingButtons = [WelcomeButtons(imageName: "P1",
                                            text: "With our powerful mobile app, pneumonia radiology analysis is extremely simple."),
                             WelcomeButtons(imageName: "P1",
                                            text: "Scan or upload chest x-rays, and our algorithms will provide different diagnoses."),
                             WelcomeButtons(imageName: "P1",
                                            text: "Before proceeding, please remember that PNEUMO is not 100% accurate.")]
    
    let CONSTANT_OFFSET: CGFloat = 8
    
    var body: some View {
        NavigationView {
        ZStack {
            Color("DarkShade")
                .edgesIgnoringSafeArea(.all)
            
            /*Rectangle()
                .fill(Color("Accent2"))
                .scaleEffect(1.4)
                .rotationEffect(.degrees(-15))
                .offset(x: -100, y: 300)*/
            
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
                        ForEach(self.onboardingButtons, id: \.id) { onB in
                            VStack(spacing: 40) {
                                Image(onB.imageName).resizable().frame(width: 400, height: 250)
                                Text("\(onB.text)")
                                    .fontWeight(.thin)
                                    .padding()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                            }.frame(width: gr.frame(in: .global).width)
                        }
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("LightShade"))
                    .font(.title)
                    .padding(.vertical, 60).frame(width: gr.frame(in: .global).width * 3)
                    .frame(maxHeight: .infinity).offset(x: self.step == 1 ? gr.frame(in: .global).width+self.CONSTANT_OFFSET : self.step == 2 ? 0 : -gr.frame(in: .global).width-self.CONSTANT_OFFSET)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                }
                HStack(spacing: 20) {
                    ForEach (1 ..< 4) { num in
                        Button(action: {self.step = num}) {
                            Image(systemName: "\(num).circle")
                                .padding()
                                .scaleEffect(self.step == num ? 1 : 0.65)
                                /*.background(Circle()
                                    .fill(Color("Accent"))
                                    .shadow(radius: 10))*/
                        }
                    }
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.5))
                .font(.largeTitle)
                .accentColor(Color("LightAccent"))
                
                NavigationLink(destination: Navigation()
                    .navigationBarHidden(true)
                    .navigationBarTitle("")) {
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
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

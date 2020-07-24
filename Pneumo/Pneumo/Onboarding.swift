//
//  Onboarding.swift
//  Pneumo
//
//  Created by Alice Chien on 7/8/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct WelcomeButtons: Identifiable {
    var id = UUID()
    var imageName: String
    var text: String
    var imgWidth: CGFloat?
    var imgHeight: CGFloat?
}

struct Onboarding: View {
    
    @State private var step = 1
    
    let onboardingButtons = [WelcomeButtons(imageName: "P1",
                                            text: "With our powerful mobile app, pneumonia radiology analysis is made simple.",
                                            imgWidth: 350,
                                            imgHeight: 300),
                             WelcomeButtons(imageName: "P2",
                                            text: "Scan or upload chest x-rays, and our algorithms will provide different diagnoses.",
                                            imgWidth: 280,
                                            imgHeight: 270),
                             WelcomeButtons(imageName: "P3",
                                            text: "Before proceeding, please remember that PNEUMO is not 100% accurate.",
                                            imgWidth: 280,
                                            imgHeight: 270)]
    
    let CONSTANT_OFFSET: CGFloat = 8
    
    var body: some View {
            ZStack {
                Color("DarkShade")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
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
                                VStack(spacing: 10) {
                                    Image(onB.imageName).resizable().frame(width: onB.imgWidth, height: onB.imgHeight)
                                    Text("\(onB.text)")
                                        .fontWeight(.thin)
                                        .padding()
                                        .fixedSize(horizontal: false, vertical: true)
                                        .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                                }.frame(width: gr.frame(in: .global).width)
                            }
                        }.offset(y: -20)
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
                            }
                        }
                    }.offset(y: -40)
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

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

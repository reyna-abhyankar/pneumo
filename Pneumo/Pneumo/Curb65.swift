//
//  Curb65.swift
//  Pneumo
//
//  Created by Alice Chien on 8/6/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct Curb65: View {
    let tests = ["Confusion",
                "BUN > 19 mg/dL (> 7 mmol/L)",
                "Respiratory Rate ≥ 30",
                "SBP < 90 mmHg or DBP ≤ 60 mmHg",
                "Age ≥ 65"]

    @State private var toggleArr = [false, false, false, false, false]
    
    var body: some View {
        VStack {
            Text("CURB-65 ASSESSMENT")
                .font(.largeTitle)
                .fontWeight(.light)
                .foregroundColor(Color("DarkShade"))
                .padding()
                .offset(y: -60)
            VStack {
                ForEach (0 ..< tests.count) { index in
                    VStack(alignment: .leading) {
                        Text("\(self.tests[index])").font(.system(size: 18, weight: .semibold)).lineLimit(2)
                            Divider()
                        HStack {
                            if self.toggleArr[index] {
                                Text("Yes")
                                    .foregroundColor(Color("Accent2"))
                            } else {
                                Text("No")
                                    .foregroundColor(Color("Accent2"))
                            }
                            Spacer()
                            Toggle("", isOn: self.$toggleArr[index])
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.top, 10)
                }
            }.offset(y: -50)
            .toggleStyle(MyToggleStyle())
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
            .navigationBarTitle("Resources", displayMode: .inline)
            
            VStack {
                Text("Number of risk factors: \(getNumTrue(arr: toggleArr))")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(Color.black)
            }.padding(20)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("Accent2"), lineWidth: 2))
        }
    }
    
    func getNumTrue(arr: Array<Bool>) -> Int {
        var count = 0
        for val in arr {
            if val { count += 1 }
        }
        return count
    }
}

struct MyToggleStyle: ToggleStyle {
    let width: CGFloat = 50

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label

            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: width, height: width / 2)
                    .foregroundColor(configuration.isOn ? .purple : .gray)
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: (width / 2) - 4, height: width / 2 - 6)
                    .padding(4)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                    }
            }
        }
    }
}

struct Curb65_Previews: PreviewProvider {
    static var previews: some View {
        Curb65()
    }
}

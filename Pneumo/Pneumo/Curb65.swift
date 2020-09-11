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
    
    let groups = ["Low risk", "Low risk", "Moderate risk", "Severe risk", "Highest risk", "Highest risk"]
    
    let score = ["0.6% 30-day mortality.\nConsider outpatient treatment.",
                "2.7% 30-day mortality.\nConsider outpatient treatment.",
                "6.8% 30-day mortality.\nConsider inpatient treatment or outpatient with close follow-up.",
                "14.0% 30-day mortality.\nConsider inpatient treatment with possible intensive care admission.",
                "27.8% 30-day mortality.\nConsider inpatient treatment with possible intensive care admission.",
                "27.8% 30-day mortality.\nConsider inpatient treatment with possible intensive care admission."]

    @State private var toggleArr = [false, false, false, false, false]
    
    var body: some View {
        VStack {
            Text("CURB-65 ASSESSMENT")
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(Color("DarkShade"))
                .padding()
                .offset(y: -20)
            VStack {
                ForEach (0 ..< tests.count) { index in
                    VStack(alignment: .leading) {
                        Text("\(self.tests[index])").font(.system(size: 18, weight: .semibold)).lineLimit(2)
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
                        Divider()
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.top, 10)
                }
            }.offset(y: -30)
            .toggleStyle(MyToggleStyle())
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
            .navigationBarTitle("Resources", displayMode: .inline)
            
            ZStack {
                Rectangle()
                .frame(width: 350, height: 130)
                .border(Color("Accent2"), width: 3)
                .foregroundColor(.white)
                VStack {
                    Text("\(groups[getNumTrue(arr: toggleArr)])")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.black)
                        .offset(y: 15)
                    Text("\(score[getNumTrue(arr: toggleArr)])")
                        .multilineTextAlignment(.center)
                        .frame(width: 330.0, height: 100.0)
                }
            }
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

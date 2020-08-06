//
//  Curb65.swift
//  Pneumo
//
//  Created by Alice Chien on 8/6/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct Curb65: View {
    @State private var isOn = false
    @State private var flag = true
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Confusion").font(.system(size: 18, weight: .semibold)).lineLimit(2)
                HStack { // <3>
                    if self.isOn {
                        Text("Yes")
                    } else {
                        Text("No")
                    }
                    Spacer()
                    Toggle("", isOn: $isOn)
                }
            }
            .padding()

            VStack(alignment: .leading) {
                Text("BUN > 19 mg/dL (> 7 mmol/L)").font(.system(size: 18, weight: .semibold)).lineLimit(2)
                HStack { // <3>
                    if self.isOn {
                        Text("Yes")
                    } else {
                        Text("No")
                    }
                    Spacer()
                    Toggle("", isOn: $isOn)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Respiratory Rate ≥ 30").font(.system(size: 18, weight: .semibold)).lineLimit(2)
                HStack { // <3>
                    if self.isOn {
                        Text("Yes")
                    } else {
                        Text("No")
                    }
                    Spacer()
                    Toggle("", isOn: $isOn)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Systolic BP < 90 mmHg or Diastolic BP ≤ 60 mmHg").font(.system(size: 18, weight: .semibold)).lineLimit(2)
                HStack {
                    if self.isOn {
                        Text("Yes")
                    } else {
                        Text("No")
                    }
                    Spacer()
                    Toggle("", isOn: $isOn)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Age ≥ 65").font(.system(size: 18, weight: .semibold)).lineLimit(2)
                HStack { // <3>
                    if self.isOn {
                        Text("Yes")
                    } else {
                        Text("No")
                    }
                    Spacer()
                    Toggle("", isOn: $isOn)
                }
            }
            .padding()
            
            }
            .toggleStyle(MyToggleStyle())
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
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


struct Curb65_Previews: PreviewProvider {
    static var previews: some View {
        Curb65()
    }
}
}

//
//  DetailView.swift
//  Pneumo
//
//  Created by Viren Abhyankar on 7/8/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Binding var addMode: Bool
    @Binding var contact: Contact
    
    var ageProxy: Binding<String> {
        Binding<String>(
            get: { "" },
            set: {
                if let value = NumberFormatter().number(from: $0) {
                    self.contact.age = value.intValue
                }
            }
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter name here...", text: self.$contact.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Enter diagnosis here...", text: self.$contact.diagnosis)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Enter date here...", text: self.$contact.date)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Enter age here...", text: ageProxy)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Enter sex here...", text: self.$contact.sex)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            .navigationBarTitle("Add Patient", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.addMode = false
            }) {
                Text("Done").bold()
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(addMode: .constant(true), contact: .constant(Contact()))
    }
}


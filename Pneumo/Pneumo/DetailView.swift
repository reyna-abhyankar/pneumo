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
    
    @State var showCaptureImageView: Bool = false
    
    var sex = ["Male", "Female", "Unspecified"]
    @State private var selectedSex = 0
    @State private var selectedDate = Date()
    
    var age = ["1", "2", "3"]
    @State private var selectedAge = 0
    
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

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.showCaptureImageView.toggle()
                }) {
                    Text("Choose photo")
                }

                Form {
                    TextField("Enter name here...", text: self.$contact.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Enter diagnosis here...", text: self.$contact.diagnosis)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                    
                    Picker(selection: $selectedSex, label: Text("Patient Sex")) {
                        ForEach(0 ..< sex.count) {
                           Text(self.sex[$0])
                        }
                    }
                    
                    TextField("Enter age here...", text: ageProxy)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding()
                }
            }
            .navigationBarTitle("Add Patient", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.addMode = false
            }) {
                Text("Done").bold()
            }).sheet(isPresented: $showCaptureImageView) {
                CaptureImageView(isShown: self.$showCaptureImageView,
                                 image: self.$contact.image)
            }
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(addMode: .constant(true), contact: .constant(Contact()))
    }
}

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
    @State private var selectedSex = 0
    
    var sex = ["Female", "Male", "Unspecified"]

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        HStack {
                            Text("Name")
                            TextField("Enter here...", text: self.$contact.name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        }
                        
                        HStack {
                            Text("Age (years)")
                            TextField("Enter age here...", value: self.$contact.age, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .padding()
                        }
 
                        
                        DatePicker("Date", selection: self.$contact.date, displayedComponents: .date)
                        
                        Picker(selection: $selectedSex, label: Text("Sex")) {
                            ForEach(0 ..< sex.count) {
                                Text(self.sex[$0])
                            }
                        }
                    }
                    Section {
                        Button(action: {
                            self.showCaptureImageView.toggle()
                        }) {
                            Text("Choose scan for diagnosis")
                        }
                    }
                }
            }
            .navigationBarTitle("Add Patient", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.contact.sex = self.sex[self.selectedSex]
                self.addMode = false
            }) {
                Text("Done").bold()
            }.disabled(self.$contact.name.wrappedValue==""))
            .sheet(isPresented: $showCaptureImageView) {
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

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
    @Binding var didCancel: Bool
    
    @State var showCaptureImageView: Bool = false
    @State private var selectedSex = 0
    
    @State var image: Image? = nil
    @State var buttonEnabled: Bool = false
    
    var sex = ["Female", "Male", "Unspecified"]

    /*var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }*/
    
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
                            ForEach(0 ..< sex.count, id:\.self) {
                                Text(self.sex[$0])
                            }
                        }
                    }
                    Section {
                        VStack {
                            Spacer()
                            Button(action: {
                                self.showCaptureImageView.toggle()
                            }) {
                                Text("Choose scan for diagnosis")
                            }.disabled(buttonEnabled)
                            Spacer()
                            HStack {
                                image?.resizable()
                                    .frame(width: 250, height: 250)
                                    .padding()
                                Button(action: {
                                    print("Clicked")
                                }) {
                                    Text("Diagnose")
                                }
                                .disabled(!buttonEnabled)
                                .frame(height: buttonEnabled ? nil : 0)
                                .opacity(buttonEnabled ? 1 : 0)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Add Patient", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.didCancel = true
                self.addMode = false
            }) {
                Text("Cancel")
            }, trailing: Button(action: {
                self.contact.sex = self.sex[self.selectedSex]
                self.contact.image = self.image ?? Image("P4")
                self.addMode = false
            }) {
                Text("Done").bold()
            }.disabled(self.$contact.name.wrappedValue==""))
            .sheet(isPresented: $showCaptureImageView) {
                CaptureImageView(isShown: self.$showCaptureImageView,
                                 image: self.$image,
                                 enabled: self.$buttonEnabled)
            }
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(addMode: .constant(true), contact: .constant(Contact()), didCancel: .constant(false))
    }
}

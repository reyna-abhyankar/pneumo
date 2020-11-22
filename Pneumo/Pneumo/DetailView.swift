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
    @Binding var didCancel: Bool
    
    @State var newContact: Contact

    @State var selectedSex = 0
    @State var buttonEnabled: Bool = false
    
    var sex = ["Female", "Male", "Unspecified"]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        HStack {
                            Text("Name")
                            TextField("Enter here...", text: self.$newContact.name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        }
                        
                        DatePicker("Date of birth", selection: self.$newContact.bday, displayedComponents: .date)
 
                        DatePicker("Date of entry", selection: self.$newContact.date, displayedComponents: .date)
                        
                        Picker(selection: $selectedSex, label: Text("Sex")) {
                            ForEach(0 ..< sex.count, id:\.self) {
                                Text(self.sex[$0])
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
                self.newContact.sex = self.sex[self.selectedSex]
                self.addMode = false
            }) {
                Text("Done").bold()
            }.disabled(self.$newContact.name.wrappedValue==""))
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(addMode: .constant(true), didCancel: .constant(false), newContact: Contact())
    }
}

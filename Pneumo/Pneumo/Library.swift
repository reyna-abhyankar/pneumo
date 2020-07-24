//
//  Library.swift
//  Pneumo
//
//  Created by Alice Chien on 7/9/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct Library: View {
    @State private var isEditable = false
    @State private var addMode = false
    @State private var contacts = [
        Contact(imageName: "P4", name: "Patient 1", diagnosis: "Pnuemonia", date: "01/26/18", age: "23", sex: "Female"),
        Contact(imageName: "P4", name: "Patient 2", diagnosis: "Not Pnuemonia", date: "01/26/18", age: "32", sex: "Female"),
        Contact(imageName: "P4", name: "Patient 3", diagnosis: "Covid Pnuemonia", date: "01/26/18", age: "18", sex: "Female")
    ]
    
    var body: some View {
        List {
            ForEach(contacts, id: \.id) { contact in
                NavigationLink(destination: ContactDetail(contact: contact)) {
                    PatientRow(contact: contact)
                }
            }
            .onMove(perform: move)
            .onLongPressGesture {
                withAnimation {
                    self.isEditable = true
                }
            }
        }
        .environment(\.editMode, isEditable ? .constant(.active) : .constant(.inactive))
        .navigationBarTitle("Patients", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.addMode = true
            //NavigationLink(destination: ContactDetail(contact: nil),
                 //          isActive: self.$addMode) { EmptyView() }
        }) {
            Image(systemName: "plus")
        })
        
    }
    
    func move(source: IndexSet, destination: Int) {
        contacts.move(fromOffsets: source, toOffset: destination)
        withAnimation {
            self.isEditable = false
        }
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}

struct PatientRow: View {
    let contact: Contact
    var body: some View {
        HStack {
            Image(contact.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .clipped()
                .cornerRadius(90)
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.system(size: 25, weight: .light, design: .default))
                Text(contact.diagnosis)
                    .font(.system(size: 18, weight: .thin, design: .default))
            }.offset(x: 20)
        }.padding(10)
    }
}

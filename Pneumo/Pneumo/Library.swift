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
    @State private var didCancel = false
    @State private var contact: Contact = Contact()
    
    @State private var contacts = [
        Contact(imageName: "P4", name: "Patient 1", diagnosis: "Pnuemonia", date: Date(timeIntervalSinceNow: 0), bday: Date(timeIntervalSince1970: 0), sex: "Female"),
        Contact(imageName: "P4", name: "Patient 2", diagnosis: "Not Pnuemonia", date: Date(timeIntervalSinceNow: 0), bday: Date(timeIntervalSince1970: 0), sex: "Female"),
        Contact(imageName: "P4", name: "Patient 3", diagnosis: "Covid Pnuemonia", date: Date(timeIntervalSinceNow: 0), bday: Date(timeIntervalSince1970: 0), sex: "Female")
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
        }) {
            Image(systemName: "plus")
        }).sheet(isPresented: $addMode) {
            DetailView(addMode: self.$addMode,
                       contact: self.$contact,
                       didCancel: self.$didCancel)
                .onDisappear(perform: self.add)
        }
    }
    
    func add() {
        if !didCancel { contacts.append(contact) }
        contact.reset()
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
            Image(uiImage: contact.image)
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

//
//  Library.swift
//  Pneumo
//
//  Created by Alice Chien on 7/9/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct Library: View {
    @State private var editMode = EditMode.inactive
    @State private var contact: Contact = Contact()
    
    @State var contacts = [
        Contact(imageName: "P4", name: "Patient 1", diagnosis: .Pneumonia, date: Date(timeIntervalSinceNow: 0), bday: Date(timeIntervalSince1970: 0), sex: "Female"),
        Contact(imageName: "P4", name: "Patient 2", diagnosis: .Normal, date: Date(timeIntervalSinceNow: 0), bday: Date(timeIntervalSince1970: 0), sex: "Female"),
        Contact(imageName: "P4", name: "Patient 3", diagnosis: .Covid, date: Date(timeIntervalSinceNow: 0), bday: Date(timeIntervalSince1970: 0), sex: "Female")
    ]
    
    var body: some View {
        List {
            ForEach(contacts, id: \.id) { contact in
                NavigationLink(destination: ContactDetail(contact: contact)) {
                    PatientRow(contact: contact)
                }
            }
            .onMove(perform: move)
            .onDelete(perform: delete)
        }
        .navigationBarTitle("Patients", displayMode: .inline)
        .navigationBarItems(trailing: EditButton())
        .environment(\.editMode, $editMode)
    }
    
    func move(source: IndexSet, destination: Int) {
        contacts.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
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
                Text(contact.diagnosis.rawValue)
                    .font(.system(size: 18, weight: .thin, design: .default))
            }.offset(x: 20)
        }.padding(10)
    }
}

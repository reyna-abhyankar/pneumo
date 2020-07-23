//
//  Library.swift
//  Pneumo
//
//  Created by Alice Chien on 7/9/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct Library: View {
    var body: some View {
        List {
            ForEach(contacts, id: \.id) { contact in
                NavigationLink(destination:ContactDetail(contact: contact)) {
                    PatientRow(contact: contact)
                }
            }
            .onDelete(perform: delete)
            .onMove(perform: move)
        }
        .navigationBarTitle("Patients", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            print("New row")
        }) {
            Image(systemName: "plus")
        })
    }
    
    func delete(offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
    
    func move(source: IndexSet, destination: Int) {
        contacts.move(fromOffsets: source, toOffset: destination)
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

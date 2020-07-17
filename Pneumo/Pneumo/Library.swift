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
        NavigationView {
            List(contacts) { contact in
                NavigationLink(destination:ContactDetail(contact: contact)) {
                    PatientRow(contact: contact)
                }
            }
            .navigationBarTitle("Patients")
            .navigationBarItems(leading: Button("Edit") { print("Edit Patient")},
                trailing:
                Button("New") {
                    print("New Patient!")}
        )
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
}

//
//  ContactDetail.swift
//  Pneumo
//
//  Created by Alice Chien on 7/9/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct ContactDetail: View {
    
    var iterableInfo: [String]
    var contact: Contact
    let leftText = ["Diagnosis", "Diagnosis Date", "Age", "Sex"]
    
    init(contact: Contact) {
        iterableInfo = [contact.diagnosis, contact.date, contact.age, contact.sex]
        self.contact = contact
    }
    
    var body: some View {
        VStack {
            Image(contact.imageName)
                .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                .clipped()
                .cornerRadius(30)
                .shadow(radius: 3)
            Text(contact.name)
                .font(.title)
                .fontWeight(.light)
                .padding(5)
            
            Form {
                Section {
                    ForEach (0 ..< iterableInfo.count) { num in
                        HStack {
                            Text(self.leftText[num])
                            Spacer()
                            Text(self.iterableInfo[num])
                                .foregroundColor(.gray)
                                .font(.callout)
                        }
                    }
                }
            }
        }
        .offset(y: 30)
        .navigationBarTitle("Patient Detail")
    }
}


struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetail(contact: contacts[0])
    }
}
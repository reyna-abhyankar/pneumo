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
    let leftText = ["Diagnosis", "Diagnosis Date", "Date of Birth", "Sex"]
    
    init(contact: Contact) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        iterableInfo = [contact.diagnosis, formatter.string(from: contact.date), formatter.string(from: contact.bday), contact.sex]
        self.contact = contact
        
    }
    
    var body: some View {
        VStack {
            Text(contact.name)
                .font(.title)
                .fontWeight(.light)
                .padding(15)
            contact.image
                .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                //.clipShape(Circle())
                .shadow(radius: 4)
                //.overlay(Circle().stroke(Color.gray, lineWidth: 5))
            
            Form {
                Section {
                    ForEach (0 ..< iterableInfo.count) { num in
                        HStack {
                            Text(self.leftText[num])
                            Spacer()
                            Text(self.iterableInfo[num])
                                .foregroundColor(.gray)
                                .font(.callout)
                                .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                            .onAppear {
                               UITableView.appearance().backgroundColor = .white
                            }
                        }
                    }
                }
            }
        }
        .offset(y: 30)
        .navigationBarTitle("Patient Detail")
        .background(Color.white)
    }
}


struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetail(contact: Contact(imageName: "P4", name: "Patient 1", diagnosis: "Pnuemonia", date: Date(timeIntervalSinceNow: 0), bday: Date(timeIntervalSince1970: 0), sex: "Female"))
    }
}


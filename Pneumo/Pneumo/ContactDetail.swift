//
//  ContactDetail.swift
//  Pneumo
//
//  Created by Alice Chien on 7/9/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct ContactDetail: View {
    
    let contact: Contact
    
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
                
                Section{
                    HStack {
                        Text("Diagnosis")
                        Spacer()
                        Text(contact.diagnosis)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                    Text("Diagnosis Date")
                    Spacer()
                    Text(contact.date)
                        .foregroundColor(.gray)
                        .font(.callout)
                    }
                    HStack {
                        Text("Age")
                        Spacer()
                        Text(contact.age)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Sex")
                        Spacer()
                        Text(contact.sex)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                        
                    }
                }
                
                
                
            }.offset(y: 30)
            
            
        }
    }


struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetail(contact: contacts[0])
    }
}

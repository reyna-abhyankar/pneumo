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
    @Binding var name: String
    let text: String
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter name here...", text: self.$name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            }
            .navigationBarTitle("Add Patient", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.addMode = false
            }) {
                Text("Done").bold()
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(addMode: .constant(true),
                   name: .constant("Enter name"),
                   text: "Add")
    }
}


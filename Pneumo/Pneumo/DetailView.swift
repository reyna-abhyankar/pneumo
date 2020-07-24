//
//  DetailView.swift
//  Pneumo
//
//  Created by Viren Abhyankar on 7/8/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Binding var showSheetView: Bool
    let text: String
    
    var body: some View {
        NavigationView {
            Text("\(text)")
            .navigationBarTitle("Add Patient", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showSheetView = false
            }) {
                Text("Done").bold()
            })
        }
    }
}
/*
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(text: "Preview")
    }
}
*/

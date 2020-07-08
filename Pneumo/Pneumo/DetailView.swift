//
//  DetailView.swift
//  Pneumo
//
//  Created by Viren Abhyankar on 7/8/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let text: String
    
    var body: some View {
        Text("\(text)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(text: "Preview")
    }
}

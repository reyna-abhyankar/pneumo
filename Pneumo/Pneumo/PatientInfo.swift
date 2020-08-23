//
//  PatientInfo.swift
//  Pneumo
//
//  Created by Alice Chien on 7/9/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import Foundation
import SwiftUI

struct Contact: Identifiable {
    var image: Image
    var name: String
    var diagnosis: String
    var date: Date
    var age: Double
    var sex: String
    var id = UUID()
    
    init(imageName: String, name: String, diagnosis: String, date: Date, age: Double, sex: String) {
        self.image = Image(imageName)
        self.name = name
        self.diagnosis = diagnosis
        self.date = date
        self.age = age
        self.sex = sex
    }
    
    init() {
        self.init(imageName: "P4", name: "", diagnosis: "", date: Date(), age: 0, sex: "")
    }
}



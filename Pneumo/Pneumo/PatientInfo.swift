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
    var imageName: String
    var name: String
    var diagnosis: String
    var date: String
    var age: Int
    var sex: String
    var id = UUID()
    
    init(imageName: String, name: String, diagnosis: String, date: String, age: Int, sex: String) {
        self.imageName = imageName
        self.name = name
        self.diagnosis = diagnosis
        self.date = date
        self.age = age
        self.sex = sex
    }
    
    init() {
        self.init(imageName: "P4", name: "", diagnosis: "", date: "", age: 0, sex: "")
    }
}



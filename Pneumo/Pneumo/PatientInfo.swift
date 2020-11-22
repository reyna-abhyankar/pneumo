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
    enum Diagnosed: String {
        case Normal
        case Pneumonia
        case Covid
    }
    
    var image: UIImage
    var name: String
    var diagnosis: Diagnosed
    var date: Date
    var bday: Date
    var sex: String
    var id = UUID()
    
    init(imageName: String, name: String, diagnosis: Diagnosed, date: Date, bday: Date, sex: String) {
        self.image = UIImage(named: imageName)!
        self.name = name
        self.diagnosis = diagnosis
        self.date = date
        self.bday = bday
        self.sex = sex
    }
    
    init() {
        self.init(imageName: "P4", name: "", diagnosis: .Normal, date: Date(), bday: Date(timeIntervalSince1970: 0), sex: "")
    }
    
    mutating func reset() {
        self.image = UIImage(named: "P4")!
        self.name = ""
        self.diagnosis = .Normal
        self.date = Date()
        self.bday = Date(timeIntervalSince1970: 0)
        self.sex = ""
    }
}



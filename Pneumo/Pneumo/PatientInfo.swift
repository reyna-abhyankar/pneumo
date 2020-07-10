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
    let imageName: String
    let name: String
    let diagnosis: String
    let date: String
    let age: String     // change to Int
    let sex: String
    let id = UUID()
}

let contacts = [
    Contact(imageName: "P4", name: "Patient 1", diagnosis: "Pnuemonia", date: "01/26/18", age: "23", sex: "Female"),
    Contact(imageName: "P4", name: "Patient 2", diagnosis: "Not Pnuemonia", date: "01/26/18", age: "32", sex: "Female"),
    Contact(imageName: "P4", name: "Patient 3", diagnosis: "Covid Pnuemonia", date: "01/26/18", age: "18", sex: "Female")
]

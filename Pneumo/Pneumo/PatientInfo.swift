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

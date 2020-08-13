//
//  ViewRouter.swift
//  Pneumo
//
//  Created by Alice Chien on 8/12/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {

    @Published var currentPage: String
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true,forKey: "didLaunchBefore")
            currentPage = "Onboarding"
        } else {
            currentPage = "Navigation"
        }
    }
}

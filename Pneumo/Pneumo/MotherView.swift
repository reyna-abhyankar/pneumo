//
//  MotherView.swift
//  Pneumo
//
//  Created by Alice Chien on 8/12/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "Onboarding" {
                Onboarding()
            } else if viewRouter.currentPage == "Navigation" {
                Navigation()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}

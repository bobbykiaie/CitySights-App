//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/5/23.
//

import SwiftUI

@main
struct CitySights_AppApp: App {
    
    @State var businessModel = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(businessModel)
        }
    }
}

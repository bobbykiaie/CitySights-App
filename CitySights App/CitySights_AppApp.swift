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
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(businessModel)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    //To do dismiss
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                        .environment(businessModel)
                }
               

        }
    }
}

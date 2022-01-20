//
//  FructusApp.swift
//  Fructus
//
//  Created by Juan Sebastian Orozco Buitrago on 1/18/22.
//

import SwiftUI

@main
struct FructusApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
            
            
        }
    }
}

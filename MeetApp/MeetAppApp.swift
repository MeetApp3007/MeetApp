//
//  MeetAppApp.swift
//  MeetApp
//
//  Created by Николай Чунихин on 25.04.2023.
//

import SwiftUI

@main
struct MeetAppApp: App {
    
    // MARK: Stored Properties

    let onboardingManager = OnboardingManager()
    
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
                .environmentObject(AppCoordinator(onboardingManager: onboardingManager))
        }
    }
}

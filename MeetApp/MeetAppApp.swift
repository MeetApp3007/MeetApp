//
//  MeetAppApp.swift
//  MeetApp
//
//  Created by Николай Чунихин on 25.04.2023.
//

import SwiftUI

@main
struct MeetAppApp: App {
    
    // MARK: Services and Managers
    let onboardingManager = OnboardingManager()
    let mainScreenFactory = MainScreenFactory()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
                .environmentObject(AppCoordinator(onboardingManager: onboardingManager, mainScreenFactory: mainScreenFactory))
        }
    }
}

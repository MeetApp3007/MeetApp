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
    let onboardingManager: OnboardingManagerProtocol
    let screenFactory: ScreenFactoryProtocol
    let authChecker: AuthManagerProtocol
    let coordinator: CoordinatorObject
    
    init() {
        self.onboardingManager = OnboardingManager()
        self.screenFactory = ScreenFactory()
        self.authChecker = AuthManager.shared
        self.coordinator = CoordinatorObject(mainScreenFactory: screenFactory, onboardingManager: onboardingManager, authChecker: authChecker)
    }
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
                .environmentObject(coordinator)
        }
    }
}

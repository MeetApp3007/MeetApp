//
//  OnboardingCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI
import Combine

enum OnboardingPage: String, Identifiable {
    case onBoarding
    
    var id: String {
        self.rawValue
    }
}

class OnBoardingCoordinator: ObservableObject, Coordinator {
    
    @Published var path = NavigationPath()
    
    var screenFactory: ScreenFactoryProtocol
    private let manager: OnboardingManagerProtocol
    
    init(screenFactory: ScreenFactoryProtocol, manager: OnboardingManagerProtocol) {
        self.screenFactory = screenFactory
        self.manager = manager
    }
    
    func push(_ page: AuthPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func performFlow(page: OnboardingPage) -> some View {
        switch page {
        case .onBoarding:
            self.screenFactory.makeOnBoarding(coordinator: self)
        }
    }
    
    func completeOnboarding() {
        manager.onboardingCompleted()
    }
}




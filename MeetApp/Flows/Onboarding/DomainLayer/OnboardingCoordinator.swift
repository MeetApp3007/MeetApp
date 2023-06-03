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

class OnBoardingCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    let isCompleted = CurrentValueSubject<Bool, Never>(false)
    
    var screenFactory: ScreenFactoryProtocol
    
    init(screenFactory: ScreenFactoryProtocol) {
        self.screenFactory = screenFactory
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
        isCompleted.send(true)
    }
}




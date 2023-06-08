//
//  OnboardingCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

// MARK: Flows
/// Флоу координатора онбординга
enum OnboardingPage: String, Identifiable {
    case onBoarding
    
    var id: String {
        self.rawValue
    }
}

final class OnBoardingCoordinator: ObservableObject, Coordinator {
    // MARK: Properties
    ///навигация
    @Published var path = NavigationPath()
    /// менеджер
    private let onboardingManager: OnboardingManagerProtocol
    /// фабрика
    private let screenFactory: ScreenFactoryProtocol
    
    // MARK: Init
    init(screenFactory: ScreenFactoryProtocol, onboardingManager: OnboardingManagerProtocol) {
        self.screenFactory = screenFactory
        self.onboardingManager = onboardingManager
    }
    
    // MARK: Methods
    ///Методы навигации
    func push(_ page: AuthPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    /// Запуск Флоу
    /// - Parameters:
    ///    - flow: Представление
    func performFlow(flow: OnboardingPage) -> some View {
        switch flow {
        case .onBoarding:
            
            var (view, viewModel) = screenFactory.makeOnBoarding()
            
            viewModel.onboardingComplete = { [weak self] in self?.completeOnboarding()}
            
            return view
        }
    }
    /// Выполнение онбординга
    func completeOnboarding() {
        onboardingManager.onboardingCompleted()
    }
}




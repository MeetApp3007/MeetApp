//
//  AppCoordinatorObject.swift
//  MeetApp
//
//  Created by Николай Чунихин on 18.05.2023.
//

import SwiftUI
import Combine

// MARK: Flows
/// Флоу координатора приложения
enum Flow: String, Identifiable {
    case onboarding, auth, tabBar
    
    var id: String {
        self.rawValue
    }
}

final class AppCoordinatorObject: ObservableObject, Coordinator {
    // MARK: Properties
    ///навигация
    @Published var path = NavigationPath()
    @Published var flow: Flow?
    
    /// менеджеры
    private var onboardingManager: OnboardingManagerProtocol
    private var authManager: AuthManagerProtocol
    
    /// фабрики
    private var screenFactory: ScreenFactoryProtocol
    private var coordinatorFactory: CoordinatorFactoryProtocol
    /// combine
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Init
    init(screenFactory: ScreenFactoryProtocol, coordinatorFactory: CoordinatorFactoryProtocol, managerFactory: ManagerFactoryProtocol) {
        self.screenFactory = screenFactory
        self.coordinatorFactory = coordinatorFactory
        self.authManager = managerFactory.makeAuthManager()
        self.onboardingManager = managerFactory.makeOnboardingManager()
    }
    
    // MARK: Methods
    ///Методы навигации
    func push(_ page: Flow) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    ///Определение Флоу
    func start() -> Flow {
        if onboardingManager.checkOnboarding() && authManager.isUserRegistered() {
            return performTabBar()
        } else if onboardingManager.checkOnboarding() {
            return performAuth()
        } else {
            return performOnboarding()
        }
    }
    
    /// Запуск Флоу
    /// - Parameters:
    ///     - flow: Представление
    @ViewBuilder
    func performFlow(flow: Flow) -> some View {
        
        switch flow {
        case .onboarding:
            self.coordinatorFactory.makeOnboardingCoordinator(screenFactory: self.screenFactory,
                                                              onboardingManager: self.onboardingManager)
        case .auth:
            self.coordinatorFactory.makeAuthCoordinator(screenFactory: self.screenFactory,
                                                        authManager: self.authManager)
        case .tabBar:
            self.coordinatorFactory.makeTabBarCoordinator(screenFactory: screenFactory, coordinatorFactory: coordinatorFactory)
        }
    }
    
    /// Запуск Онбординга
    func performOnboarding() -> Flow {
        self.onboardingManager.isCompleted
            .sink { [weak self] isCompleted in
                if isCompleted {
                    self?.popToRoot()
                }
            }
            .store(in: &cancellables)
        return .onboarding
    }
    
    /// Запуск Авторизации
    func performAuth() -> Flow {
        
        self.authManager.isCompleted
            .sink { [weak self] isCompleted in
                if isCompleted {
                    self?.popToRoot()
                }
            }
            .store(in: &cancellables)
        
        return .auth
    }
    
    /// Запуск ТабБара
    func performTabBar() -> Flow {
        return .tabBar
    }
}

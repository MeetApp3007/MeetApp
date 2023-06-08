//
//  CoordinatorFactory.swift
//  MeetApp
//
//  Created by Николай Чунихин on 04.06.2023.
//
import SwiftUI

///Интерфейс фабрики координаторов
protocol CoordinatorFactoryProtocol {
    /// Создание Координатора приложения
    /// - Parameters:
    ///    - screenFactory: фабрика сцен
    ///    - coordinatorFactory: фабрика координаторов
    ///    - managerFactory: фабрика менеджеров
    @ViewBuilder
    func makeAppCoordinator(screenFactory: ScreenFactoryProtocol, coordinatorFactory: CoordinatorFactoryProtocol, managerFactory: ManagerFactoryProtocol)  -> AnyView
    
    /// Создание координатора онбординга
    /// - Parameters:
    ///    - screenFactory: фабрика сцен
    ///    - onboardingManager: фабрика менеджеров
    @ViewBuilder
    func makeOnboardingCoordinator(screenFactory: ScreenFactoryProtocol, onboardingManager: OnboardingManagerProtocol) -> AnyView
    
    /// Создание координатора авторизации
    ///  - Parameters:
    ///     - screenFactory: фабрика сцен
    ///     - authManager: менеджер авторизации
    @ViewBuilder
    func makeAuthCoordinator(screenFactory: ScreenFactoryProtocol, authManager: AuthManagerProtocol) -> AnyView
    
    /// Создание координатора ТабБара
    /// - Parameters:
    ///    - screenFactory: фабрика сцен
    ///    - coordinatorFactory: фабрика координаторов
    @ViewBuilder
    func makeTabBarCoordinator(screenFactory: ScreenFactoryProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> AnyView
    
    /// Создание главного координатора
    ///  - Parameters:
    ///     - screenFactory: фабрика сцен
    @ViewBuilder
    func makeMainCoordinator(screenFactory: ScreenFactoryProtocol) -> AnyView
    
    /// Создание координатора карт
    ///  - Parameters:
    ///     - screenFactory: фабрика сцен
    @ViewBuilder
    func makeMapCoordinator(screenFactory: ScreenFactoryProtocol) -> AnyView
    
    /// Создание координатора профиля
    ///  - Parameters:
    ///     - screenFactory: фабрика сцен
    @ViewBuilder
    func makeProfileCoordinator(screenFactory: ScreenFactoryProtocol) -> AnyView
    
}

final class CoordinatorFactory {}

// MARK: extension CoordinatorFactoryProtocol
extension CoordinatorFactory: CoordinatorFactoryProtocol {
    // MARK: Methods
    /// Создание Координатора приложения
    /// - Parameters:
    ///    - screenFactory: фабрика сцен
    ///    - coordinatorFactory: фабрика координаторов
    ///    - managerFactory: фабрика менеджеров
    @ViewBuilder
    func makeAppCoordinator(screenFactory: ScreenFactoryProtocol, coordinatorFactory: CoordinatorFactoryProtocol, managerFactory: ManagerFactoryProtocol) -> AnyView {
        let coordinator = AppCoordinatorObject(screenFactory: screenFactory, coordinatorFactory: coordinatorFactory, managerFactory: managerFactory)
        let coordinatorView = AppCoordinatorView().environmentObject(coordinator)
        AnyView(coordinatorView)
    }
    /// Создание координатора онбординга
    /// - Parameters:
    ///    - screenFactory: фабрика сцен
    ///    - onboardingManager: онбординг менеджер
    @ViewBuilder
    func makeOnboardingCoordinator(screenFactory: ScreenFactoryProtocol,  onboardingManager: OnboardingManagerProtocol) -> AnyView {
        let coordinator = OnBoardingCoordinator(screenFactory: screenFactory, onboardingManager: onboardingManager)
        let coordinatorView = OnboardinCoordinatorView().environmentObject(coordinator)
        AnyView(coordinatorView)
    }
    /// Создание координатора авторизации
    ///  - Parameters:
    ///     - screenFactory: фабрика сцен
    ///     - authManager: менеджер авторизации
    func makeAuthCoordinator(screenFactory: ScreenFactoryProtocol, authManager: AuthManagerProtocol) -> AnyView {
        let coordinator = AuthCoordinator(screenFactory: screenFactory, authManager: authManager)
        let coordinatorView = AuthCoordinatorView().environmentObject(coordinator)
        return AnyView(coordinatorView)
    }
    /// Создание координатора
    /// - Parameters:
    ///    - screenFactory: фабрика сцен
    ///    - coordinatorFactory: фабрика координаторов
    @ViewBuilder
    func makeTabBarCoordinator(screenFactory: ScreenFactoryProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> AnyView {
        let coordinator = TabBarCoordinator(screenFactory: screenFactory, coordinatorFactory: coordinatorFactory)
        let coordinatorView = TabBarCoordinatorView().environmentObject(coordinator)
        AnyView(coordinatorView)
    }
    /// Создание главного координатора
    ///  - Parameters:
    ///     - screenFactory: фабрика сцен
    @ViewBuilder
    func makeMainCoordinator(screenFactory: ScreenFactoryProtocol) -> AnyView {
        let coordinator = MainCoordinator(screenFactory: screenFactory)
        let coordinatorView = MainCoordinatorView().environmentObject(coordinator)
        AnyView(coordinatorView)
    }
    /// Создание координатора карт
    ///  - Parameters:
    ///     - screenFactory: фабрика сцен
    @ViewBuilder
    func makeMapCoordinator(screenFactory: ScreenFactoryProtocol) -> AnyView {
        let coordinator = MapCoordinator(screenFactory: screenFactory)
        let coordinatorView = MapCoordinatorView().environmentObject(coordinator)
        AnyView(coordinatorView)
    }
    /// Создание координатора профиля
    ///  - Parameters:
    ///     - screenFactory: фабрика сцен
    @ViewBuilder
    func makeProfileCoordinator(screenFactory: ScreenFactoryProtocol) -> AnyView {
        let coordinator = ProfileCoordinator(screenFactory: screenFactory)
        let coordinatorView = ProfileCoordinatorView().environmentObject(coordinator)
        AnyView(coordinatorView)
    }
}

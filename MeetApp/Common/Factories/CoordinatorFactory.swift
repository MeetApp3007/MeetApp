//
//  CoordinatorFactory.swift
//  MeetApp
//
//  Created by Николай Чунихин on 04.06.2023.
//
import SwiftUI

protocol CoordinatorFactoryProtocol {
    
    @ViewBuilder
    func makeAppCoordinator(screenFactory: ScreenFactoryProtocol, coordinatorFactory: CoordinatorFactoryProtocol, managerFactory: ManagerFactoryProtocol)  -> AnyView
    @ViewBuilder
    func makeOnboardingCoordinator(factory: ScreenFactoryProtocol,  manager: OnboardingManagerProtocol) -> AnyView
    
    func makeAuthCoordinator(factory: ScreenFactoryProtocol, manager: AuthManagerProtocol) -> AnyView
    @ViewBuilder
    func makeTabBarCoordinator(factory: ScreenFactoryProtocol) -> AnyView
    @ViewBuilder
    func makeMainCoordinator() -> AnyView
    @ViewBuilder
    func makeMapCoordinator() -> AnyView
    @ViewBuilder
    func makeProfileCoordinator() -> AnyView
    
}

final class CoordinatorFactory {}

extension CoordinatorFactory: CoordinatorFactoryProtocol {
    
    @ViewBuilder
    func makeAppCoordinator(screenFactory: ScreenFactoryProtocol, coordinatorFactory: CoordinatorFactoryProtocol, managerFactory: ManagerFactoryProtocol) -> AnyView {
        let coordinator = AppCoordinatorObject(screenFactory: screenFactory, coordinatorFactory: coordinatorFactory, managerFactory: managerFactory)
        let coordinatorView = AppCoordinatorView().environmentObject(coordinator)
        AnyView(coordinatorView)
    }
    @ViewBuilder
    func makeOnboardingCoordinator(factory: ScreenFactoryProtocol, manager: OnboardingManagerProtocol) -> AnyView {
        let coordinator = OnBoardingCoordinator(screenFactory: factory, manager: manager)
        let coordinatorView = OnboardinCoordinatorView().environmentObject(coordinator)
        AnyView(coordinatorView)
    }
    
    func makeAuthCoordinator(factory: ScreenFactoryProtocol, manager: AuthManagerProtocol) -> AnyView {
        let coordinator = AuthCoordinator(screenFactory: factory, manager: manager)
        let coordinatorView = AuthCoordinatorView().environmentObject(coordinator)
        return AnyView(coordinatorView)
    }
    @ViewBuilder
    func makeTabBarCoordinator(factory: ScreenFactoryProtocol) -> AnyView {
        let coordinator = TabBarCoordinator(screenFactory: factory)
        let coordinatorView = TabBarCoordinatorView().environmentObject(coordinator)
        AnyView(coordinatorView)
    }
    @ViewBuilder
    func makeMainCoordinator() -> AnyView {
        AnyView(EmptyView())
    }
    @ViewBuilder
    func makeMapCoordinator() -> AnyView {
        AnyView(EmptyView())
    }
    @ViewBuilder
    func makeProfileCoordinator() -> AnyView {
        AnyView(EmptyView())
    }
}

//
//  MainScreenFactory.swift
//  MeetApp
//
//  Created by Николай Чунихин on 04.05.2023.
//

import SwiftUI
/// Протокол фабрики сцен
protocol ScreenFactoryProtocol {
    @ViewBuilder
    func makeOnBoarding(coordinator: OnBoardingCoordinator) -> AnyView
    @ViewBuilder
    func makeRegisterView() -> (AnyView, RegisterScreenOutput)
    @ViewBuilder
    func makeLoginView() -> (AnyView, LoginScreenOutput)
    @ViewBuilder
    func makeTabBarView(coordinator: TabBarCoordinator) ->  AnyView
    @ViewBuilder
    func makeMainView(coordinator: MainCoordinator) ->  AnyView
    @ViewBuilder
    func makeMapView(coordinator: MapCoordinator) ->  AnyView
    @ViewBuilder
    func makeProfileView(coordinator: ProfileCoordinator) ->  AnyView
}

/// Фабрика сцен
final class ScreenFactory {}


extension ScreenFactory: ScreenFactoryProtocol {
    
    func makeRegisterView() -> (AnyView, RegisterScreenOutput) {
        let viewModel = RegisterViewModel()
        let view = RegisterView().environmentObject(viewModel)
        return (AnyView(view), viewModel)
    }
    
    func makeLoginView() -> (AnyView, LoginScreenOutput) {
        let viewModel = LoginViewModel()
        let view = LoginView().environmentObject(viewModel)
        return (AnyView(view), viewModel)
    }
   
    /// Создание сцен
    @ViewBuilder
    func makeOnBoarding(coordinator: OnBoardingCoordinator) -> AnyView {
        let viewModel = OnboardingViewModel(coordinator: coordinator)
        let view = OnboardingView().environmentObject(viewModel)
        AnyView(view)
    }

    

    
    @ViewBuilder
    func makeTabBarView(coordinator: TabBarCoordinator) ->  AnyView {
        let viewModel = TabBarViewModel(coordinator: coordinator)
        let view = TabBarView().environmentObject(viewModel)
        AnyView(view)
    }
    
    @ViewBuilder
    func makeMainView(coordinator: MainCoordinator) ->  AnyView {
        let viewModel = MainViewModel()
        let view = MainView().environmentObject(viewModel)
        AnyView(view)
    }
    
    @ViewBuilder
    func makeMapView(coordinator: MapCoordinator) ->  AnyView {
        let viewModel = MapViewModel()
        let view = MapView().environmentObject(viewModel)
        AnyView(view)
    }
    
    @ViewBuilder
    func makeProfileView(coordinator: ProfileCoordinator) ->  AnyView {
        let viewModel = ProfileViewModel()
        let view = ProfileView().environmentObject(viewModel)
        AnyView(view)
    }
    
}




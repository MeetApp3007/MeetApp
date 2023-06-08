//
//  MainScreenFactory.swift
//  MeetApp
//
//  Created by Николай Чунихин on 04.05.2023.
//

import SwiftUI
/// Интерфейс фабрики сцен
protocol ScreenFactoryProtocol {
    /// Создание экрана онбординга
    func makeOnBoarding() -> (AnyView, OnboardingScreenOutput)
    /// Создание экрана регистраци
    func makeRegisterView() -> (AnyView, RegisterScreenOutput)
    /// Создание экрана авторизации
    func makeLoginView() -> (AnyView, LoginScreenOutput)
    /// Создание главного экрана
    func makeMainView() ->  (AnyView, MainScreenOutput)
    /// Создание экрана карты
    func makeMapView() ->  (AnyView, MapScreenOutput)
    /// Создание экрана профиля
    func makeProfileView() ->  (AnyView, ProfileScreenOutput)
}

/// Фабрика сцен
final class ScreenFactory {}

// MARK: extension ScreenFactoryProtocol
extension ScreenFactory: ScreenFactoryProtocol {
    // MARK: Methods
    /// Создание экрана онбординга
    func makeOnBoarding() -> (AnyView, OnboardingScreenOutput) {
        let viewModel = OnboardingViewModel()
        let view = OnboardingView().environmentObject(viewModel)
        return (AnyView(view), viewModel)
    }
    /// Создание экрана регистраци
    func makeRegisterView() -> (AnyView, RegisterScreenOutput) {
        let viewModel = RegisterViewModel()
        let view = RegisterView().environmentObject(viewModel)
        return (AnyView(view), viewModel)
    }
    /// Создание экрана авторизации
    func makeLoginView() -> (AnyView, LoginScreenOutput) {
        let viewModel = LoginViewModel()
        let view = LoginView().environmentObject(viewModel)
        return (AnyView(view), viewModel)
    }
    /// Создание главного экрана
    func makeMainView() ->  (AnyView, MainScreenOutput) {
        let viewModel = MainViewModel()
        let view = MainView().environmentObject(viewModel)
        return (AnyView(view), viewModel)
    }
    /// Создание экрана карты
    func makeMapView() ->  (AnyView, MapScreenOutput) {
        let viewModel = MapViewModel()
        let view = MapView().environmentObject(viewModel)
        return (AnyView(view), viewModel)
    }
    /// Создание экрана профиля
    func makeProfileView() ->  (AnyView, ProfileScreenOutput) {
        let viewModel = ProfileViewModel()
        let view = ProfileView().environmentObject(viewModel)
        return (AnyView(view), viewModel)
    }
    
}

//
//  MainScreenFactory.swift
//  MeetApp
//
//  Created by Николай Чунихин on 04.05.2023.
//

import SwiftUI

protocol MainScreenFactoryProtocol {
    func makeOnBoarding() -> AnyView
    func makeAuthView() -> AnyView
    func makeTabBarView() -> AnyView
}

final class MainScreenFactory {}

extension MainScreenFactory: MainScreenFactoryProtocol {
    func makeOnBoarding() -> AnyView {
        let viewModel = OnboardingViewModel()
        let coordinator = OnBoardingCoordinator()
        return AnyView(coordinator.start()
            .environmentObject(viewModel))
    }
    
    func makeAuthView() -> AnyView {
        return AnyView(Text("Auth"))
    }

    func makeTabBarView() -> AnyView {
        let viewModel = TabBarViewModel()
        let coordinator = TabBarCoordinator()
        return AnyView(coordinator.start()
            .environmentObject(viewModel))
    }

}




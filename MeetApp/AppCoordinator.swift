//
//  AppCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 26.04.2023.
//
import SwiftUI

protocol AppCoordinatorProtocol {
    func performFlow() -> AnyView
    func performOnboarding() -> AnyView
    func performAuth() -> AnyView
    func performTabBar() -> AnyView
}

final class AppCoordinator: ObservableObject{
    
    //MARK: - private services
    private let onboardingManager: OnboardingManager
    private let mainScreenFactory: MainScreenFactoryProtocol

    //MARK: - Init
    init(onboardingManager: OnboardingManager, mainScreenFactory: MainScreenFactoryProtocol) {
        self.onboardingManager = onboardingManager
        self.mainScreenFactory = mainScreenFactory
    }
    
}

extension AppCoordinator: Coordinator {
    //MARK: - start

    func start() -> AnyView {
        self.performFlow()
    }
    
}

extension AppCoordinator: AppCoordinatorProtocol {
    internal func performFlow() -> AnyView{
        let flow: AnyView
        if onboardingManager.hasOnboardingCompleted() {
            flow = performTabBar()
        } else {
            flow = performOnboarding()
            onboardingManager.setOnboardingCompleted()
        }
        return flow
    }
    
    internal func performOnboarding() -> AnyView {
        let onboarding = mainScreenFactory.makeOnBoarding()
        return AnyView(onboarding)
    }
    
    internal func performAuth() -> AnyView {
        return AnyView(Text("Auth"))
    }
    
    internal func performTabBar() -> AnyView{
        let tabBar = mainScreenFactory.makeTabBarView()
        return AnyView(tabBar)
    }
}

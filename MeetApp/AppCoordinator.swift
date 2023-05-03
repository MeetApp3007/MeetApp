//
//  AppCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 26.04.2023.
//

import Foundation
import SwiftUI


final class AppCoordinator: ObservableObject, Coordinator {
    
    //MARK: - private services
    private let onboardingManager: OnboardingManager
    
    //MARK: - Init
    init(onboardingManager: OnboardingManager) {
        self.onboardingManager = onboardingManager
    }
    
    
    //MARK: - perform flows
    
    func start() -> AnyView {
        self.performFlow()
    }
    
    private func performFlow() -> AnyView{
        let flow: AnyView
        if onboardingManager.hasOnboardingCompleted() {
            flow = performTabBar()
        } else {
            flow = performOnboarding()
            onboardingManager.setOnboardingCompleted()
        }
        return flow
    }
    
    private func performOnboarding() -> AnyView {
        return AnyView(OnboardingView())
    }
    
    private func performAuth() -> AnyView {
        return AnyView(Text("Auth"))
    }
    
    private func performTabBar() -> AnyView{
        return AnyView(
            TabBarView(coordinator: TabBarCoordinator())
        )
    }
    
}

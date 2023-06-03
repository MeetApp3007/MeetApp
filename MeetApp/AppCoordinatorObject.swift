//
//  AppCoordinatorObject.swift
//  MeetApp
//
//  Created by Николай Чунихин on 18.05.2023.
//

import SwiftUI
import Combine

enum Flow: String, Identifiable {
    case onboarding, auth, tabBar
    
    var id: String {
        self.rawValue
    }
}

class CoordinatorObject: ObservableObject {
    
    @Published var path = NavigationPath()
    //@Published var flow: Flow?
    
    private var onboardingManager: OnboardingManagerProtocol
    private var screenFactory: ScreenFactoryProtocol
    private var authChecker: AuthManagerProtocol
    
    private var authCoordinator: AuthCoordinator?
    private var onBoardingCoordinator: OnBoardingCoordinator?
    private var tabBabrCoordinator: TabBarCoordinator?
    
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Init
    init(mainScreenFactory: ScreenFactoryProtocol, onboardingManager: OnboardingManagerProtocol, authChecker: AuthManagerProtocol) {
        self.screenFactory = mainScreenFactory
        self.onboardingManager = onboardingManager
        self.authChecker = authChecker
    }
    
    func push(_ page: Flow) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func start() -> Flow {
        if onboardingManager.checkOnboarding() && authChecker.isUserRegistered() {
            return performTabBar()
        } else if onboardingManager.checkOnboarding() {
            return performAuth()
        } else {
            return performOboarding()
        }
    }
    
    
    @ViewBuilder
    func performFlow(flow: Flow) -> some View {
        
        switch flow {
        case .onboarding:
            OnboardinCoordinatorView()
                .environmentObject(self.onBoardingCoordinator!)
        case .auth:
            AuthCoordinatorView()
                .environmentObject(self.authCoordinator!)
        case .tabBar:
            TabBarView()
                .environmentObject(self.tabBabrCoordinator!)
        }
    }
    
    func performOboarding() -> Flow {
        self.onBoardingCoordinator = OnBoardingCoordinator(screenFactory: self.screenFactory)
        self.onboardingManager.setOnboardingCompleted()
        self.onBoardingCoordinator?.isCompleted
            .sink { [weak self] isCompleted in
                if isCompleted {
                    self?.popToRoot()
                }
            }
            .store(in: &cancellables)
        return .onboarding
    }
    
    func performAuth() -> Flow {
        self.authCoordinator = AuthCoordinator(screenFactory: self.screenFactory)
        self.authChecker.logInUser()
        self.authCoordinator?.isCompleted
            .sink { [weak self] isCompleted in
                if isCompleted {
                    self?.popToRoot()
                }
            }
            .store(in: &cancellables)
        return .auth
    }
    
    func performTabBar() -> Flow {
        self.tabBabrCoordinator = TabBarCoordinator(screenFactory: self.screenFactory)
        return .tabBar
    }
}

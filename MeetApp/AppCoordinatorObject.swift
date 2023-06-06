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

class AppCoordinatorObject: ObservableObject, Coordinator {
    
    @Published var path = NavigationPath()
    //@Published var flow: Flow?
    
    // кто убил? //MARK: Managers
    private var onboardingManager: OnboardingManagerProtocol
    private var authManager: AuthManagerProtocol
    
    //MARK: Factories
    private var screenFactory: ScreenFactoryProtocol
    private var coordinatorFactory: CoordinatorFactoryProtocol
        
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Init
    init(screenFactory: ScreenFactoryProtocol, coordinatorFactory: CoordinatorFactoryProtocol, managerFactory: ManagerFactoryProtocol) {
        self.screenFactory = screenFactory
        self.coordinatorFactory = coordinatorFactory
        self.authManager = managerFactory.makeAuthManager()
        self.onboardingManager = managerFactory.makeOnboardingManager()
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
        if onboardingManager.checkOnboarding() && authManager.isUserRegistered() {
            return performTabBar()
        } else if onboardingManager.checkOnboarding() {
            return performAuth()
        } else {
            return performOnboarding()
        }
    }
    
    
    @ViewBuilder
    func performFlow(flow: Flow) -> some View {
        
        switch flow {
        case .onboarding:
            self.coordinatorFactory.makeOnboardingCoordinator(factory: self.screenFactory,
                                                              manager: self.onboardingManager)
        case .auth:
            self.coordinatorFactory.makeAuthCoordinator(factory: self.screenFactory,
                                                        manager: self.authManager)
        case .tabBar:
            self.coordinatorFactory.makeTabBarCoordinator(factory: screenFactory)
        }
    }
    
    
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
    
    
    func performTabBar() -> Flow {
        
        return .tabBar
    }
}

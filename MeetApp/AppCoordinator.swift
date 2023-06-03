////
////  AppCoordinator.swift
////  MeetApp
////
////  Created by Николай Чунихин on 26.04.2023.
////
//import SwiftUI
//
//protocol AppCoordinatorProtocol {
//    func performFlow() -> AnyView
//    func performOnboarding() -> AnyView
//    func performAuth() -> AnyView
//    func performTabBar() -> AnyView
//}
//
//final class AppCoordinator: BaseCoordinator {
//    
//    //MARK: - private services
//    private var onboardingManager: OnboardingManager
//    private var mainScreenFactory: ScreenFactoryProtocol?
//    private var authChecker: AuthManager
//    
//    //MARK: - Init
//    init(mainScreenFactory: ScreenFactoryProtocol?, onboardingManager: OnboardingManager, authChecker: AuthManager) {
//        self.mainScreenFactory = mainScreenFactory
//        self.onboardingManager = onboardingManager
//        self.authChecker = authChecker
//    }
//    
//    /// Старт
//    override func start() -> AnyView {
//        return performFlow()
//    }
//  
//}
//
///// Реализация протокола
//extension AppCoordinator: AppCoordinatorProtocol {
//    internal func performFlow() -> AnyView{
//        let flow: AnyView
//        if onboardingManager.checkOnboarding() && authChecker.isUserRegistered() {
//            flow = performTabBar()
//        } else if onboardingManager.checkOnboarding() {
//            flow = performAuth()
//        } else {
//            flow = performOnboarding()
//            onboardingManager.setOnboardingCompleted()
//        }
//        return flow
//    }
//    
//    func performOnboarding() -> AnyView {
//        guard let screenFactory = self.mainScreenFactory else { return AnyView(EmptyView())}
//        let coordinator = OnBoardingCoordinator(screenFactory: screenFactory as! ScreenFactory)
//        
//        coordinator.onboardingCompletedAction = { [weak self] in
//            guard let _self = self else { return } 
//                
//            self?.onboardingManager.setOnboardingCompleted()
//            self?.performFlow()
//            self?.removeChild(coordinator)
//        }
//        
//        self.addChild(coordinator)
//        return AnyView(coordinator.start())
//    }
//    
//    func performAuth() -> AnyView {
//        guard let screenFactory = self.mainScreenFactory else { return AnyView(EmptyView())}
//        let coordinator = AuthCoordinator(screenFactory: screenFactory as! ScreenFactory)
//        self.addChild(coordinator)
//        
//        
//        
//        return AnyView(coordinator.start())
//    }
//    
//    func performTabBar() -> AnyView{
//        guard let screenFactory = self.mainScreenFactory else { return AnyView(EmptyView())}
//        let coordinator = TabBarCoordinator(screenFactory: screenFactory as! ScreenFactory)
//        self.addChild(coordinator)
//        
//        
//        
//        return AnyView(coordinator.start())
//    }
//    
//}
//

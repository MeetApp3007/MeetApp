//
//  AuthCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//
import SwiftUI


enum AuthPage: String, Identifiable {
    case login, register
    
    var id: String {
        self.rawValue
    }
}

class AuthCoordinator: ObservableObject, Coordinator {
    
    @Published var path = NavigationPath()
    @Published var flow: AuthPage?
    
    //MARK: init properties
    var screenFactory: ScreenFactoryProtocol
    private let authManager: AuthManagerProtocol
    
    init(screenFactory: ScreenFactoryProtocol, manager: AuthManagerProtocol) {
        self.screenFactory = screenFactory
        self.authManager = manager
    }
    
    func present(_ page: AuthPage) {
        self.flow = page
    }

    
    func push(_ page: AuthPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismiss() {
        self.flow = nil
    }
    
    func performFlow(page : AuthPage) -> some View {
        switch page {
        case .login:
            
            var (view, viewModel) = screenFactory.makeLoginView()
            
            viewModel.onLogin = { [weak self] in self?.login() }
            viewModel.roadToRegisterScreen = { [weak self] in self?.present(.register) }
            
            return view
        case .register:
            
            var (view, viewModel) = screenFactory.makeRegisterView()
            
            viewModel.onRegister = { [weak self] in self?.register() }
            viewModel.roadToLoginScreen = { [weak self] in self?.dismiss() }
            
            return view
            }
        }
    
    
    func login() {
        authManager.authCompleted()
    }
    
    func register() {
        authManager.authCompleted()
    }
}

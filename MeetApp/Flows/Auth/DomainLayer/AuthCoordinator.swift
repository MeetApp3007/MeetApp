//
//  AuthCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//
import SwiftUI

// MARK: Flows
/// Флоу координатора авторизации
enum AuthPage: String, Identifiable {
    case login, register
    
    var id: String {
        self.rawValue
    }
}

final class AuthCoordinator: ObservableObject, Coordinator {
    // MARK: Properties
    ///навигация
    @Published var path = NavigationPath()
    @Published var flow: AuthPage?
    /// менеджер
    private let authManager: AuthManagerProtocol
    /// фабрика
    private var screenFactory: ScreenFactoryProtocol
    
    
    //MARK: Init
    init(
        screenFactory: ScreenFactoryProtocol,
        authManager: AuthManagerProtocol
    ) {
        self.screenFactory = screenFactory
        self.authManager = authManager
    }
    
    // MARK: Methods
    ///Методы навигации
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
    
    /// Запуск Флоу
    /// - Parameters:
    ///     - flow: Представление
    func performFlow(flow: AuthPage) -> some View {
        switch flow {
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
    
    /// Выполнение авторизации
    func login() {
        authManager.authCompleted()
    }
    /// Выполнение регистрации
    func register() {
        authManager.authCompleted()
    }
}

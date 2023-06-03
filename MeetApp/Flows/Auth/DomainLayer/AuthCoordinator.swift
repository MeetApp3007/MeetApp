//
//  AuthCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//
import SwiftUI
import Combine

enum AuthPage: String, Identifiable {
    case login, register
    
    var id: String {
        self.rawValue
    }
}

class AuthCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var flow: AuthPage?
    
    let isCompleted = CurrentValueSubject<Bool, Never>(false)
    
    var screenFactory: ScreenFactoryProtocol
    
    init(screenFactory: ScreenFactoryProtocol) {
        self.screenFactory = screenFactory
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
            return self.screenFactory.makeAuthView(coordinator: self, type: .login)
        case .register:
            return self.screenFactory.makeAuthView(coordinator: self, type: .register)
        }
    }
    
    func login() {
        isCompleted.send(true)
    }
    
    func register() {
        isCompleted.send(true)
    }
}

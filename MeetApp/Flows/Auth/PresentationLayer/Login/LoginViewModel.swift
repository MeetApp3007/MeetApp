//
//  AuthViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//
import Foundation

/// Интерфейс вывода экрана авторизации
protocol LoginScreenOutput {
    var onLogin: () -> Void { get set }
    var roadToRegisterScreen: () -> Void { get set }
    func goToRegister()
}

final class LoginViewModel: ObservableObject, LoginScreenOutput {
    // MARK: Properties
    var onLogin: () -> Void = {}
    var roadToRegisterScreen: () -> Void = {}
    // MARK: Init
    init() {}
    // MARK: Methods
    /// Прохождение авторизации
    func login() {
        onLogin()
    }
    /// переход на экран регистрации
    func goToRegister() {
        roadToRegisterScreen()
    }
}



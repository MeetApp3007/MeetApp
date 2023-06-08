//
//  RegisterViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 03.06.2023.
//

import Foundation
/// Интерфейс вывода экрана регистрации
protocol RegisterScreenOutput {
    var onRegister: () -> Void { get set }
    var roadToLoginScreen: () -> Void { get set }
    func goToLogin()
}

final class RegisterViewModel: ObservableObject, RegisterScreenOutput {
    // MARK: Properties
    var onRegister: () -> Void = {}
    var roadToLoginScreen: () -> Void = {}
    // MARK: Init
    init() {}
    // MARK: Methods
    /// Прохождение регистрации
    func register() {
        onRegister()
    }
    /// переход на экран авторизации
    func goToLogin() {
        roadToLoginScreen()
    }
}


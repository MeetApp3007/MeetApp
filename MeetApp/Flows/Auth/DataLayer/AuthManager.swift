//
//  AuthManager.swift
//  MeetApp
//
//  Created by Николай Чунихин on 06.05.2023.
//

import Foundation
import Combine

/// общий интерфейс авторизации
protocol AuthManagerProtocol: AuthManagerUD, AuthCombine {}

/// интерфейс сохранения данных пользователя
protocol AuthManagerUD {
    /// Проверка авторизации пользователя
    func isUserRegistered() -> Bool
    /// Авторизация
    func logInUser()
    /// Выход
    func logOutUser()
    /// Выполнить авторизацию
    func authCompleted()
}
/// Интерфейс для переменной из combine
protocol AuthCombine {
    var isCompleted: CurrentValueSubject<Bool, Never> { get set }
}


/// Менеджер авторизации
final class AuthManager: AuthCombine {
    /// Выполнен
    var isCompleted = CurrentValueSubject<Bool, Never>(false)
    /// UserDefaults
    private let userDefaults = UserDefaults.standard
}

// MARK: extension AuthManagerUD
/// Реализация протокола авторизации
extension AuthManager : AuthManagerUD {
    // MARK: - Methods
    /// Выполнить авторизацию
    func authCompleted() {
        logInUser()
        isCompleted.send(true)
    }
    /// Проверка авторизации пользователя
    func isUserRegistered() -> Bool {
        return userDefaults.bool(forKey: "isUserRegistered")
    }
    /// Авторизация
    func logInUser() {
        userDefaults.set(true, forKey: "isUserRegistered")
    }
    /// выход
    func logOutUser() {
        userDefaults.set(false, forKey: "isUserRegistered")
    }
    
}
// MARK: extension OnboardingManagerProtocol
/// подпись авторизации на общий  протокол
extension AuthManager: AuthManagerProtocol {}


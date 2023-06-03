//
//  AuthManager.swift
//  MeetApp
//
//  Created by Николай Чунихин on 06.05.2023.
//

import Foundation

protocol AuthManagerProtocol {
    func isUserRegistered() -> Bool
    func logInUser()
    func logOutUser()
}

/// Менеджер авторизации
final class AuthManager : AuthManagerProtocol {
    
    // MARK: - Properties
    /// Singleton
    static let shared = AuthManager()
    
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Public methods
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
    
    // MARK: - Private init
    /// Конструктор
    private init() {}
}


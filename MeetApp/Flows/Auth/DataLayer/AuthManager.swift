//
//  AuthManager.swift
//  MeetApp
//
//  Created by Николай Чунихин on 06.05.2023.
//

import Foundation
import Combine

protocol AuthManagerProtocol: AuthManagerUD, AuthCombine {}

protocol AuthManagerUD {
    
    func isUserRegistered() -> Bool
    func logInUser()
    func logOutUser()
    func authCompleted()
}

protocol AuthCombine {
    var isCompleted: CurrentValueSubject<Bool, Never> { get set }
}


/// Менеджер авторизации
final class AuthManager: AuthCombine {
    var isCompleted = CurrentValueSubject<Bool, Never>(false)
   
    private let userDefaults = UserDefaults.standard
}

///
extension AuthManager : AuthManagerUD {
    // MARK: - Public methods
    
    
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

extension AuthManager: AuthManagerProtocol {}


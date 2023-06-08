//
//  ManagerFactory.swift
//  MeetApp
//
//  Created by Николай Чунихин on 04.06.2023.
//

import Foundation
/// Интерфейс фабрики менеджеров
protocol ManagerFactoryProtocol {
    /// Создание менеджера онбординга
    func makeOnboardingManager() -> OnboardingManagerProtocol
    /// Создание менеджера авторизации
    func makeAuthManager() -> AuthManagerProtocol
}

final class ManagerFactory {}

// MARK: extension ScreenFactoryProtocol
extension ManagerFactory: ManagerFactoryProtocol {
    // MARK: Methods
    /// Создание менеджера онбординга
    func makeOnboardingManager() -> OnboardingManagerProtocol {
        return OnboardingManager()
    }
    /// Создание менеджера авторизации
    func makeAuthManager() -> AuthManagerProtocol {
        return AuthManager()
    }

}

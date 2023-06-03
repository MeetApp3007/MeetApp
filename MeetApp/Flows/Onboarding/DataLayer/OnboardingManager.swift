//
//  UserDefaultsManager.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import Foundation

/// Протокол онбординга
protocol OnboardingManagerProtocol {
    /// Проверка онбординга
    func checkOnboarding() -> Bool
    /// Установка статуса онбординга
    func setOnboardingCompleted()
}

/// Онбординг
final class OnboardingManager {
    private let userDefaults = UserDefaults.standard
}

/// Реализация протокола онбординга
extension OnboardingManager: OnboardingManagerProtocol {
    /// Проверка онбординга
    func checkOnboarding() -> Bool {
        return userDefaults.bool(forKey: "hasOnboardingCompleted")
    }
    /// Установка статуса онбординга
    func setOnboardingCompleted() {
        userDefaults.set(true, forKey: "hasOnboardingCompleted")
    }
}

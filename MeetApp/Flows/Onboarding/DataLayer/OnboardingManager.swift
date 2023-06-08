//
//  UserDefaultsManager.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import Foundation
import Combine

/// общий интерфейс онбординга
protocol OnboardingManagerProtocol: OnboardingManagerUD, OnboardingCombine {}

/// интерфейс сохранения данных пользователя
protocol OnboardingManagerUD {
    /// Выполнение онбординга
    func onboardingCompleted()
    /// Проверка онбординга
    func checkOnboarding() -> Bool
    /// Установка статуса онбординга
    func setOnboardingCompleted()
}
/// Интерфейс для переменной из combine
protocol OnboardingCombine {
    /// Выполнен
    var isCompleted: CurrentValueSubject<Bool, Never> { get set }
}

/// Онбординг
final class OnboardingManager: OnboardingCombine {
    /// Выполнен
    var isCompleted = CurrentValueSubject<Bool, Never>(false)
    /// UserDefaults
    private let userDefaults = UserDefaults.standard
}

// MARK: extension OnboardingManagerUD
/// Реализация протокола онбординга
extension OnboardingManager: OnboardingManagerUD {
    // MARK: - Public methods
    /// Выполнение онбординга
    func onboardingCompleted() {
        setOnboardingCompleted()
        isCompleted.send(true)
    }
    /// Проверка онбординга
    func checkOnboarding() -> Bool {
        return userDefaults.bool(forKey: "hasOnboardingCompleted")
    }
    /// Установка статуса онбординга
    func setOnboardingCompleted() {
        userDefaults.set(true, forKey: "hasOnboardingCompleted")
    }
}

// MARK: extension OnboardingManagerProtocol
/// подпись онбординга на общий  протокол
extension OnboardingManager: OnboardingManagerProtocol {}

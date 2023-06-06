//
//  UserDefaultsManager.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import Foundation
import Combine

protocol OnboardingManagerProtocol: OnboardingManagerUD, OnboardingCombine {}

/// Протокол онбординга
protocol OnboardingManagerUD {
    
    func onboardingCompleted()
    /// Проверка онбординга
    func checkOnboarding() -> Bool
    /// Установка статуса онбординга
    func setOnboardingCompleted()
}

protocol OnboardingCombine {
    var isCompleted: CurrentValueSubject<Bool, Never> { get set }
}

/// Онбординг
final class OnboardingManager: OnboardingCombine {
    
    var isCompleted = CurrentValueSubject<Bool, Never>(false)
    
    private let userDefaults = UserDefaults.standard
}

/// Реализация протокола онбординга
extension OnboardingManager: OnboardingManagerUD {
    
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

extension OnboardingManager: OnboardingManagerProtocol {}

//
//  UserDefaultsManager.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import Foundation

//protocol

final class OnboardingManager {
    private let userDefaults = UserDefaults.standard
    
    func hasOnboardingCompleted() -> Bool {
        return userDefaults.bool(forKey: "hasOnboardingCompleted")
    }
    
    func setOnboardingCompleted() {
        userDefaults.set(true, forKey: "hasOnboardingCompleted")
    }
}

//
//  ManagerFactory.swift
//  MeetApp
//
//  Created by Николай Чунихин on 04.06.2023.
//

import Foundation

protocol ManagerFactoryProtocol {
    func makeOnboardingManager() -> OnboardingManagerProtocol
    func makeAuthManager() -> AuthManagerProtocol
}

final class ManagerFactory {}

extension ManagerFactory: ManagerFactoryProtocol {
    func makeOnboardingManager() -> OnboardingManagerProtocol {
        return OnboardingManager()
    }
    
    func makeAuthManager() -> AuthManagerProtocol {
        return AuthManager()
    }

}

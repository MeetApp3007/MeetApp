//
//  OnboardingViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import Foundation
/// Интерфейс вывода онбординга
protocol OnboardingScreenOutput {
    var onboardingComplete: () -> Void { get set }
}

final class OnboardingViewModel: ObservableObject, OnboardingScreenOutput {
    // MARK: Properties
    var onboardingComplete: () -> Void = {}
    
    // MARK: Init
    init() {}
    
    // MARK: Methods
    /// Прохождение онбординга
    func completeOnboarding() {
        onboardingComplete()
    }
}

//
//  OnboardingViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI


class OnboardingViewModel: ObservableObject {
    private let coordinator: OnBoardingCoordinator
    
    
    init(coordinator: OnBoardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func completeOnboarding() {
        coordinator.completeOnboarding()
    }
}

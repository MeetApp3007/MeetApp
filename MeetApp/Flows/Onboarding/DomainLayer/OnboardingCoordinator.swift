//
//  OnboardingCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

class OnBoardingCoordinator: ObservableObject, Coordinator {
    
    func start() -> AnyView {
        return AnyView(AuthViewLogin())
    }
    
}



//
//  AuthViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    var coordinator: AuthCoordinator

    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }
    
    func login() {
        coordinator.login()
    }
    
    func goRegister() {
        coordinator.present(.register)
    }
}

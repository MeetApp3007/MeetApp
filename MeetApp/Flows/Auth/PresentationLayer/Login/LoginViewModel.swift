//
//  AuthViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

class LoginViewModel: ObservableObject, LoginScreenOutput {
    
    var onLogin: () -> Void = {}
    var roadToRegisterScreen: () -> Void = {}
    
//    var coordinator: AuthCoordinator

//    init(coordinator: AuthCoordinator) {
//        self.coordinator = coordinator
//    }
    
    init() {}
    
    func login() {
        onLogin()
//        coordinator.login()
    }
    
    func goToRegister() {
        roadToRegisterScreen()
//        coordinator.present(.register)
    }
}

protocol LoginScreenOutput {
    var onLogin: () -> Void { get set }
    var roadToRegisterScreen: () -> Void { get set }
    func goToRegister()
}

//
//  RegisterViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 03.06.2023.
//

import Foundation

class RegisterViewModel: ObservableObject, RegisterScreenOutput {
    var onRegister: () -> Void = {}
    
    var roadToLoginScreen: () -> Void = {}
    
    init() {}
    
    func register() {
        onRegister()
    }
    
    func goToLogin() {
        roadToLoginScreen()
    }
}

protocol RegisterScreenOutput {
    var onRegister: () -> Void { get set }
    var roadToLoginScreen: () -> Void { get set }
    func goToLogin()
}

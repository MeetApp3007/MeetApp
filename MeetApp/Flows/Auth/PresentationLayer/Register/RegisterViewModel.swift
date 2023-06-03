//
//  RegisterViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 03.06.2023.
//

import Foundation

class RegisterViewModel: ObservableObject {
    var coordinator: AuthCoordinator

    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }
    
    func goLogin() {
        coordinator.dismiss()
    }
}

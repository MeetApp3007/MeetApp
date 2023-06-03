//
//  ProfileCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

class ProfileCoordinator {
    
    let screenFactory: ScreenFactory
    
    init(screenFactory: ScreenFactory) {
        self.screenFactory = screenFactory
    }
    
    func start() -> some View {
        EmptyView()
    }
}

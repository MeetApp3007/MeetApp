//
//  MeetAppApp.swift
//  MeetApp
//
//  Created by Николай Чунихин on 25.04.2023.
//

import SwiftUI

@main
struct MeetAppApp: App {
    
    // MARK: Factories
    let screenFactory: ScreenFactoryProtocol
    let coordinatorFactory: CoordinatorFactoryProtocol
    let managerFactory: ManagerFactoryProtocol
    
    init() {
        self.screenFactory = ScreenFactory()
        self.coordinatorFactory = CoordinatorFactory()
        self.managerFactory = ManagerFactory()
        
    }
    
    var body: some Scene {
        WindowGroup {
            coordinatorFactory.makeAppCoordinator(screenFactory: screenFactory,
                                                  coordinatorFactory: coordinatorFactory,
                                                  managerFactory: managerFactory)
        }
    }
}

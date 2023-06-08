//
//  MeetAppApp.swift
//  MeetApp
//
//  Created by Николай Чунихин on 25.04.2023.
//

import SwiftUI

@main
struct MeetAppApp: App {
    
    // MARK: Properties
    ///Фабрики
    let screenFactory: ScreenFactoryProtocol
    let coordinatorFactory: CoordinatorFactoryProtocol
    let managerFactory: ManagerFactoryProtocol
    
    // MARK: Init
    init() {
        self.screenFactory = ScreenFactory()
        self.coordinatorFactory = CoordinatorFactory()
        self.managerFactory = ManagerFactory()
        
    }
    
    // MARK: Body
    var body: some Scene {
        WindowGroup {
            ///Запуск координатора приложения
            coordinatorFactory.makeAppCoordinator(screenFactory: screenFactory,
                                                  coordinatorFactory: coordinatorFactory,
                                                  managerFactory: managerFactory)
        }
    }
}

//
//  MainCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

class MainCoordinator {
    
    let factory: ScreenFactory
    
    init(factory: ScreenFactory) {
        self.factory = factory
    }
    
    func start() -> AnyView {
        return AnyView(self.factory.makeMainView(coordinator: self))
    }
    
}

//
//  BaseCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import Foundation
import SwiftUI

/// Протокол координатора
protocol Coordinator: AnyObject {
    func start() -> AnyView
}

/// Базовая реализация координатора
class BaseCoordinator: Coordinator {
    
    /// Дочерние координаторы
    var childCoordinators: [Coordinator] = []
    
    /// Запуск флоу
    func start() -> AnyView {
        return AnyView(_)
    }
}

/// Реализация управления дочерними координаторами
extension BaseCoordinator {
    
    func addChild(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator?) {
        guard !childCoordinators.isEmpty, let coordinator = coordinator else { return }
        
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter { $0 !== coordinator }
                .forEach { coordinator.removeChild($0) }
        }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
    
    public func cleanDependency() {
        self.childCoordinators.removeAll()
    }
}

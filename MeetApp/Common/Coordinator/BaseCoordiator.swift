//
//  BaseCoordiator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 04.05.2023.
//

import SwiftUI

/// Базовый координатор
class BaseCoordinator: Coordinator {
    /// Дочерние координаторы
    var childCoordinators: [Coordinator] = []
    /// Старт
    func start() -> AnyView {
        return AnyView(EmptyView())
    }
    
    /// Добавить дочерний координатор
    /// - Parameter coordinator: Координатор
    func addChild(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }

    /// Удалить дочерний координатор
    /// - Parameter coordinator: Координатор
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
}

///// Реализация управления зависимостями
//extension BaseCoordinator {
//   
//}


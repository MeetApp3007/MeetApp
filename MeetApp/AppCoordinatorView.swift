//
//  AppCoordinatorView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 18.05.2023.
//

import SwiftUI


struct AppCoordinatorView: View, CoordinatorView {
    
    // MARK: Properties
    /// Подписка на координатор
    @EnvironmentObject var coordinator: AppCoordinatorObject
    
    // MARK: Body
    var body: some View {
        start()
    }
    // MARK: Methods
    /// Запуск координатора
    func start() -> some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.performFlow(flow: coordinator.start())
                .navigationDestination(for: Flow.self) { page in
                    coordinator.performFlow(flow: coordinator.start())
                }
                .environmentObject(coordinator)
        }
    }
}

struct AppCoordinatorView__Previews: PreviewProvider {
    static var previews: some View {
        AppCoordinatorView()
            .environmentObject(
                AppCoordinatorObject(
                    screenFactory: ScreenFactory(),
                    coordinatorFactory: CoordinatorFactory(),
                    managerFactory: ManagerFactory()
                )
            )
    }
}

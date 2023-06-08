//
//  AuthCoordinatorView .swift
//  MeetApp
//
//  Created by Николай Чунихин on 03.06.2023.
//

import SwiftUI

struct AuthCoordinatorView: View, CoordinatorView {
    // MARK: Properties
    /// Подписка на координатор
    @EnvironmentObject var coordinator: AuthCoordinator
    // MARK: Body
    var body: some View {
        start()
    }
    // MARK: Methods
    /// Запуск координатора
    func start() -> some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.performFlow(flow: .login)
                .navigationDestination(for: AuthPage.self, destination: { page in
                    coordinator.performFlow(flow: page)
                })
                .fullScreenCover(item: $coordinator.flow) { page in
                    coordinator.performFlow(flow: page)
                }
        }
    }
}

struct AuthCoordinatorView__Previews: PreviewProvider {
    static var previews: some View {
        AuthCoordinatorView()
    }
}

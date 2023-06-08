//
//  ProfileCoordinatorView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 08.06.2023.
//

import SwiftUI

struct ProfileCoordinatorView: View, CoordinatorView {
    
    // MARK: Properties
    /// Подписка на координатор
    @EnvironmentObject private var coordinator: ProfileCoordinator
    
    // MARK: Body
    var body: some View {
        start()
    }
    // MARK: Methods
    /// Запуск координатора
    func start() -> some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.performFlow(page: .profile).navigationDestination(for: ProfilePage.self, destination: { page in
                coordinator.performFlow(page: page)
            })
            .fullScreenCover(item: $coordinator.flow) { page in
                coordinator.performFlow(page: page)
            }
        }
    }
}

struct ProfileCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCoordinatorView()
    }
}

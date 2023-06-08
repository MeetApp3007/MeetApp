//
//  MapCoordinatorView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 08.06.2023.
//

import SwiftUI

struct MapCoordinatorView: View, CoordinatorView {
    
    // MARK: Properties
    /// Подписка на координатор
    @EnvironmentObject private var coordinator: MapCoordinator
    
    // MARK: Body
    var body: some View {
        start()
    }
    // MARK: Methods
    /// Запуск координатора
    func start() -> some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.performFlow(flow: .map).navigationDestination(for: MapPage.self, destination: { page in
                coordinator.performFlow(flow: page)
            })
            .fullScreenCover(item: $coordinator.flow) { page in
                coordinator.performFlow(flow: page)
            }
        }
    }
}

struct MapCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        MapCoordinatorView()
    }
}

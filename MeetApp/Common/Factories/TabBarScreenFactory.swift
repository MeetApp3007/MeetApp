//
//  MainScreenFactory.swift
//  MeetApp
//
//  Created by Николай Чунихин on 04.05.2023.
//

import SwiftUI

protocol TabBarScreenFactoryProtocol {
   func makeMainView() -> AnyView
   func makeMapView() -> AnyView
   func makeProfileView() -> AnyView
}

final class TabBarScreenFactory {}

extension TabBarScreenFactory: TabBarScreenFactoryProtocol {
    func makeMainView() -> AnyView {
        let viewModel = MainViewModel()
        let coordinator = MainCoordinator()
        return AnyView(coordinator.start()
            .environmentObject(viewModel))
    }

    func makeMapView() -> AnyView {
        let viewModel = MapViewModel()
        let coordinator = MapCoordinator()
        return AnyView(coordinator.start()
            .environmentObject(viewModel))
    }

    func makeProfileView() -> AnyView {
        let viewModel = ProfileViewModel()
        let coordinator = ProfileCoordinator()
        return AnyView(coordinator.start()
            .environmentObject(viewModel))
    }
}

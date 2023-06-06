//
//  AppCoordinatorView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 18.05.2023.
//

import SwiftUI


struct AppCoordinatorView: View {
    
    @EnvironmentObject var coordinator: AppCoordinatorObject
    
    var body: some View {
        start()
    }
    
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



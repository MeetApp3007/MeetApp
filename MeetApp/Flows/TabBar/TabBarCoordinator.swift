//
//  TabBarCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

class TabBarCoordinator: ObservableObject {
    @Published var selectedTab: TabBarViewModel.Tab
    
    init(selectedTab: TabBarViewModel.Tab) {
        self.selectedTab = selectedTab
    }
    
    func start() -> some View {
        let viewModel = TabBarViewModel()
        viewModel.selectedTab = selectedTab
        
        switch selectedTab {
        case .main:
            return Text("Main")
//            let coordinator = MainCoordinator()
//            return coordinator.start()
                .tabItem {
                    viewModel.getTabBarItem(for: .main)
                }
                .tag(TabBarViewModel.Tab.main)

        case .map:
            return Text("Map")
//            let coordinator = MapCoordinator()
//            return coordinator.start()
                .tabItem {
                    viewModel.getTabBarItem(for: .map)
                }
                .tag(TabBarViewModel.Tab.map)

        case .profile:
            return Text("Profile")
//            let coordinator = ProfileCoordinator()
//            return coordinator.start()
                .tabItem {
                    viewModel.getTabBarItem(for: .profile)
                }
                .tag(TabBarViewModel.Tab.profile)
        }
    }
}

//
//  TabBarCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI
import UIKit

class TabBarCoordinator: ObservableObject, Coordinator {
    @Published var selectedTab: TabBarViewModel.Tab
    
    init() {
        self.selectedTab = .main
    }
    
    func start() -> AnyView {
        let viewModel = TabBarViewModel()
        viewModel.selectedTab = selectedTab
        
        switch selectedTab {
        case .main:
            let coordinator = MainCoordinator()
            return coordinator.start()
                .tabItem {
                    viewModel.getTabBarItem(for: .main)
                }
                .tag(TabBarViewModel.Tab.main)
                .transformViewType()

        case .map:
            let coordinator = MapCoordinator()
            return coordinator.start()
                .tabItem {
                    viewModel.getTabBarItem(for: .map)
                }
                .tag(TabBarViewModel.Tab.map)
                .transformViewType()

        case .profile:
            let coordinator = ProfileCoordinator()
            return coordinator.start()
                .tabItem {
                    viewModel.getTabBarItem(for: .profile)
                }
                .tag(TabBarViewModel.Tab.profile)
                .transformViewType()
        }
    }
}

//extension TabBarCoordinator: Hashable {
//    static func == (lhs: TabBarCoordinator, rhs: TabBarCoordinator) -> Bool {
//        return lhs.selectedTab == rhs.selectedTab
//    }
//
//    func hash(into hasher: inout Hasher) {
//            hasher.combine(selectedTab)
//    }
//}

extension View {
    func transformViewType() -> AnyView {
        return AnyView(self)
    }
}

protocol ViewModel {}
protocol MyView: UIViewController {}

//struct Screen<View: ViewModel, ViewModel: MyView> {
//    let view: View
//    let model: ViewModel
//}

//protocol screenFactory {
//    func makeTabBarScreen() ->
//}

// SOLID - Dependency Inversion
class MyService {
    let repo: MyRepoProtocol
    
    init(repo: MyRepoProtocol) {
        self.repo = repo
    }
}

protocol MyRepoProtocol {}

class MyRepo: MyRepoProtocol {}
////////////////////////////////////////////////////////////////////////////////////////////////////




//
//  TabBarCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//
import SwiftUI

class TabBarCoordinator: ObservableObject, Coordinator {
    @Published var selectedTab: TabBarViewModel.Tab
    
    let screenFactory: TabBarScreenFactory = TabBarScreenFactory()

    init() {
        self.selectedTab = .main
    }

    func start() -> AnyView {
        let viewModel = TabBarViewModel()
        viewModel.selectedTab = selectedTab

        return TabView(selection: Binding(
            get: { self.selectedTab },
            set: { self.selectedTab = $0 }
        )) {
            let mainScreen = screenFactory.makeMainView()
            mainScreen
                .tabItem {
                    viewModel.getTabBarItem(for: .main)
                }
                .tag(TabBarViewModel.Tab.main)

            MapCoordinator()
                .start()
                .tabItem {
                    viewModel.getTabBarItem(for: .map)
                }
                .tag(TabBarViewModel.Tab.map)

            ProfileCoordinator()
                .start()
                .tabItem {
                    viewModel.getTabBarItem(for: .profile)
                }
                .tag(TabBarViewModel.Tab.profile)
        }
        .accentColor(.blue) // Можно установить цвет выбранного таба
        .transformViewType()
    }
}


extension View {
    func transformViewType() -> AnyView {
        return AnyView(self)
    }
}

//
//protocol ViewModel {}
//protocol MyView: UIViewController {}
//
////struct Screen<View: ViewModel, ViewModel: MyView> {
////    let view: View
////    let model: ViewModel
////}
//
////protocol screenFactory {
////    func makeTabBarScreen() ->
////}
//
//// SOLID - Dependency Inversion
//class MyService {
//    let repo: MyRepoProtocol
//
//    init(repo: MyRepoProtocol) {
//        self.repo = repo
//    }
//}
//
//protocol MyRepoProtocol {}
//
//class MyRepo: MyRepoProtocol {}
////////////////////////////////////////////////////////////////////////////////////////////////////




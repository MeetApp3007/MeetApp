//
//  TabBarCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import Combine
import SwiftUI

class TabBarCoordinator: ObservableObject, Coordinator {
    
    var screenFactory: ScreenFactoryProtocol
    
    init(screenFactory: ScreenFactoryProtocol) {
        self.screenFactory = screenFactory
    }
    
    func start() -> some View {
        Text("TabBar")
    }
    
    
}







//import SwiftUI
//import Combine
//
//protocol TabBarCoordinatorProtocol {
//    func performFlow() -> AnyView
//    func performMain() -> AnyView
//    func performMap() -> AnyView
//    func performProfile() -> AnyView
//}
//
//class TabBarCoordinator: BaseCoordinator {
//
//
//    var screenFactory: ScreenFactoryProtocol
//
//    init(screenFactory: ScreenFactory) {
//        self.screenFactory = screenFactory
//
//    }
//
//    override func start() -> AnyView {
//
//        let viewModel = TabBarViewModel()
//        viewModel.$selectedTab
//            .sink { [self] tab in
//                switch tab {
//                case .main:
//                    performMain()
//                case .map:
//                    performMap()
//                case .profile:
//                    performProfile()
//                }
//            }
//            .store(in: &cancellables)
//
//        let tabView = TabBarView {
//            EmptyView()
//        }
//        .environmentObject(viewModel)
//
//        return AnyView(tabView)
//        //        let viewModel = TabBarViewModel()
//        //        viewModel.selectedTab = selectedTab
//        //        screenFactory.makeTabBarView()
//        //        return TabView(selection: Binding(
//        //            get: { self.selectedTab },
//        //            set: { self.selectedTab = $0 }
//        //        )) {
//        //            let mainScreen = screenFactory.makeMainView()
//        //            MainCoordinator(factory: screenFactory)
//        //                .start()
//        //                .tabItem {
//        //                    viewModel.getTabBarItem(for: .main)
//        //                }
//        //                .tag(TabBarViewModel.Tab.main)
//        //
//        //            MapCoordinator()
//        //                .start()
//        //                .tabItem {
//        //                    viewModel.getTabBarItem(for: .map)
//        //                }
//        //                .tag(TabBarViewModel.Tab.map)
//        //
//        //            ProfileCoordinator()
//        //                .start()
//        //                .tabItem {
//        //                    viewModel.getTabBarItem(for: .profile)
//        //                }
//        //                .tag(TabBarViewModel.Tab.profile)
//        //        }
//        //        .accentColor(.blue) // Можно установить цвет выбранного таба
//        //        .transformViewType()
//    }
//
//    private var cancellables = Set<AnyCancellable>()
//
//}
//
//
//extension TabBarCoordinator: TabBarCoordinatorProtocol {
//    func performFlow() -> AnyView {
//        return performMain()
//    }
//
//    func performMain() -> AnyView {
//        let coordinator = MapCoordinator(screenFactory: screenFactory as! ScreenFactory)
//        self.addChild(coordinator)
//        return AnyView(coordinator.start())
//    }
//
//    func performMap() -> AnyView {
//        return AnyView(EmptyView())
//    }
//
//    func performProfile() -> AnyView {
//        return AnyView(EmptyView())
//    }
//}


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




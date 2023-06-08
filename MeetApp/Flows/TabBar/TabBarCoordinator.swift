//
//  TabBarCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import Combine
import SwiftUI

enum TabPage: String, Identifiable {
    case mainFlow, mapFlow, profileFlow
    
    var id: String {
        self.rawValue
    }
}

class TabBarCoordinator: ObservableObject, Coordinator {
    
    // MARK: Properties
    ///навигация
    @Published var path = NavigationPath()
    @Published var flow: TabPage?
    @Published var selectedTab: TabItem.TabItemType = .maim
    let tabs = [
        TabItem(imageName: "list.bullet", title: "Main", type: .maim),
        TabItem(imageName: "map", title: "Map", type: .map),
        TabItem(imageName: "person", title: "Profile", type: .profile)
    ]
    /// фабрики
    private let screenFactory: ScreenFactoryProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    
    // MARK: Init
    init(screenFactory: ScreenFactoryProtocol, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.screenFactory = screenFactory
        self.coordinatorFactory = coordinatorFactory
    }
    
    // MARK: Methods
    ///Методы навигации
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func push(_ page: TabPage) {
        path.append(page)
    }
    
    func present(_ page: TabPage) {
        self.flow = page
    }
    
    func dismiss() {
        self.flow = nil
    }
    
    /// Запуск Флоу
    /// - Parameters:
    ///    - tab: Представление
    @ViewBuilder
    func performFlow(tab: TabPage) -> some View {
        switch tab {
        case .mainFlow:
            
            performMain()
        case .mapFlow:
            
            performMap()
        case .profileFlow:
            
            performProfile()
        }
    }
    /// Запуск главного экрана
    func performMain() -> some View {
        coordinatorFactory.makeMainCoordinator(screenFactory: screenFactory)
    }
    /// Запуск экрана с картой
    func performMap() -> some View {
        coordinatorFactory.makeMapCoordinator(screenFactory: screenFactory)
    }
    /// Запуск экрана профиля
    func performProfile() -> some View {
        coordinatorFactory.makeProfileCoordinator(screenFactory: screenFactory)
    }
}


//
//  TabBarCoordinatorView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 03.06.2023.
//

import SwiftUI

struct TabBarCoordinatorView: View, CoordinatorView {
    // MARK: Properties
    /// Подписка на координатор
    @EnvironmentObject var coordinator: TabBarCoordinator
    
    // MARK: Body
    var body: some View {
        start()
    }
    // MARK: Methods
    /// Запуск координатора
    func start() -> some View {
        TabView(selection: $coordinator.selectedTab) {
            ForEach(coordinator.tabs, id: \.self) { tab in
                tabView(for: tab.type)
                    .tabItem {
                        Image(systemName: tab.imageName)
                        Text(tab.title)
                    }.tag(tab.type)
            }
        }.accentColor(.yellow)
    }
    /// Отрисовка Табов
    /// - Parameters:
    ///    - for tabItemType:  тип отрисовываемого таба
    func tabView(for tabItemType: TabItem.TabItemType) -> some View {
        switch tabItemType {
        case .maim:
            return coordinator.performFlow(tab: .mainFlow)
        case .map:
            return coordinator.performFlow(tab: .mapFlow)
        case .profile:
            return coordinator.performFlow(tab: .profileFlow)
        }
    }
}

struct TabBarCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarCoordinatorView()
    }
}

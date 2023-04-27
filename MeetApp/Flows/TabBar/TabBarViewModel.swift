//
//  TabBarViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

final class TabBarViewModel: ObservableObject {
    @Published var selectedTab: Tab = .main
    
    enum Tab: Int {
        case main, map, profile
    }
    
    var tabBarItems: [TabBarItem] {
        [
            TabBarItem(title: "Home", icon: "house", tab: .main),
            TabBarItem(title: "Map", icon: "map", tab: .map),
            TabBarItem(title: "Profile", icon: "person", tab: .profile)
        ]
    }
    
    func getTabBarItem(for tab: Tab) -> TabBarItem {
        return tabBarItems.first { $0.tab == tab }!
    }
}

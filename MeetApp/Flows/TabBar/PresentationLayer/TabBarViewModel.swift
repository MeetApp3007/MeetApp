//
//  TabBarViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

final class TabBarViewModel: ObservableObject {
    @Published var selectedTab: Tab = .map
    
    enum Tab: Int {
        case main, map, profile
        
        var title: String {
            switch self {
            case .main:
                return "Home"
            case .map:
                return "Map"
            case .profile:
                return "Profile"
            }
        }
        
        var icon: String {
            switch self {
            case .main:
                return "house"
            case .map:
                return "map"
            case .profile:
                return "person"
            }
        }
    }
    
    var tabBarItems: [TabBarItem] {
        [
            TabBarItem(title: Tab.main.title, icon: Tab.main.icon, tab: .main),
            TabBarItem(title: Tab.map.title, icon: Tab.map.icon, tab: .map),
            TabBarItem(title: Tab.profile.title, icon: Tab.profile.icon, tab: .profile)
        ]
    }
    
    func getTabBarItem(for tab: Tab) -> TabBarItem {
        return tabBarItems.first { $0.tab == tab }!
    }
}


//
//  TabBarView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var coordinator: TabBarCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            coordinator.start()
        }
    }
}

// TabBarItem.swift
struct TabBarItem: View {
    let title: String
    let icon: String
    let tab: TabBarViewModel.Tab
    
    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(title)
        }
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}

struct Item {}

struct Container {
    init(item: Item) {
        
    }
    
    var item: Item?
    
    func setItem(_ item: Item) {
        
    }
}
//
//var container = Container(item: .init())
//container.setItem(.init())
//container.item = .init()

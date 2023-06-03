//
//  TabBarView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

struct TabBarView: View {

    @EnvironmentObject var viewModel: TabBarViewModel
    
    var body: some View {
        Text("TabBar")
            .font(.system(size: 32, weight: .heavy, design: .rounded))
    }
}






























//struct Item {}
//
//struct Container {
//    init(item: Item) {
//
//    }
//
//    var item: Item?
//
//    func setItem(_ item: Item) {
//
//    }
//}
//

//var container = Container(item: .init())
//container.setItem(.init())
//container.item = .init()

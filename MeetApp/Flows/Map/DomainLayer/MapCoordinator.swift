//
//  MapCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

// MARK: Flows
/// Флоу координатора карты
enum MapPage: String, Identifiable {
    case map
    
    var id: String {
        self.rawValue
    }
}

class MapCoordinator: ObservableObject, Coordinator {
    // MARK: Properties
    ///навигация
    @Published var path = NavigationPath()
    @Published var flow: MapPage?
    /// фабрика
    let screenFactory: ScreenFactoryProtocol
    
    // MARK: Init
    init(screenFactory: ScreenFactoryProtocol) {
        self.screenFactory = screenFactory
    }
    
    // MARK: Methods
    ///Методы навигации
    func present(_ page: MapPage) {
        self.flow = page
    }

    func push(_ page: MapPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismiss() {
        self.flow = nil
    }
    /// Запуск Флоу
    /// - Parameters:
    ///    - flow: Представлен
    func performFlow(flow: MapPage) -> some View {
        switch flow {
        case .map:
            var (view, viewModel) = screenFactory.makeMapView()
            
            return view
        }
    }
}

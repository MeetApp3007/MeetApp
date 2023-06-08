//
//  MainCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

// MARK: Flows
/// Флоу координатора
enum MainPage: String, Identifiable {
    case meet
    
    var id: String {
        self.rawValue
    }
}

final class MainCoordinator: ObservableObject, Coordinator {
    // MARK: Properties
    ///навигация
    @Published var path = NavigationPath()
    @Published var flow: MainPage?
    /// фабрика
    private let screenFactory: ScreenFactoryProtocol
    
    // MARK: Init
    init(screenFactory: ScreenFactoryProtocol) {
        self.screenFactory = screenFactory
    }
    
    // MARK: Methods
    ///Методы навигации
    func present(_ page: MainPage) {
        self.flow = page
    }

    func push(_ page: MainPage) {
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
    ///    - flow: Представление
    func performFlow(flow: MainPage) -> some View {
        switch flow {
        case .meet:
            let (view, viewModel) = screenFactory.makeMainView()
            
            return view
        }
    }
    
    
}

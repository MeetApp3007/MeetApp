//
//  ProfileCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

// MARK: Flows
/// Флоу координатора онбординга
enum ProfilePage: String, Identifiable {
    case profile
    
    var id: String {
        self.rawValue
    }
}

final class ProfileCoordinator: ObservableObject, Coordinator {
    // MARK: Properties
    ///навигация
    @Published var path = NavigationPath()
    @Published var flow: ProfilePage?
    /// фабрика
    let screenFactory: ScreenFactoryProtocol
    
    // MARK: Init
    init(screenFactory: ScreenFactoryProtocol) {
        self.screenFactory = screenFactory
    }
    
    // MARK: Methods
    ///Методы навигации
    func present(_ page: ProfilePage) {
        self.flow = page
    }
    
    func push(_ page: ProfilePage) {
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
    func performFlow(page: ProfilePage) -> some View {
        switch page {
        case .profile:
            let (view, viewModel) = screenFactory.makeProfileView()
            
            return view
        }
    }
    
}

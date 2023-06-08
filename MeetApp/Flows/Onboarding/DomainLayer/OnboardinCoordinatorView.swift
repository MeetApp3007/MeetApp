//
//  OnboardinCoordinatorView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 03.06.2023.
//

import SwiftUI

struct OnboardinCoordinatorView: View, CoordinatorView {
    // MARK: Properties
    /// Подписка на координатор
    @EnvironmentObject var coordinator: OnBoardingCoordinator
    
    // MARK: Body
    var body: some View {
        start()
    }
    // MARK: Methods
    /// Запуск координатора
    func start() -> some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.performFlow(flow: .onBoarding)
        }
    }
}

struct OnboardinCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardinCoordinatorView()
    }
}

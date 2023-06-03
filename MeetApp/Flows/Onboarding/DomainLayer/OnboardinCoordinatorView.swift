//
//  OnboardinCoordinatorView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 03.06.2023.
//

import SwiftUI

struct OnboardinCoordinatorView: View {
    
    @EnvironmentObject var coordinator: OnBoardingCoordinator
    
    var body: some View {
        start()
    }
    
    func start() -> some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.performFlow(page: .onBoarding)
        }
    }
}

struct OnboardinCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardinCoordinatorView()
    }
}

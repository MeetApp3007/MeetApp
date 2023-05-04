//
//  AppCoordinatorView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

struct AppCoordinatorView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
        
        var body: some View {
            coordinator.start()
            
        }
}



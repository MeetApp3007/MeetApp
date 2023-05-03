//
//  MapCoordinator.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

class MapCoordinator: ObservableObject, Coordinator {
    
    func start() -> AnyView {
        return AnyView(MapView())
    }
    
}

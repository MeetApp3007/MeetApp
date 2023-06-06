//
//  AuthCoordinatorView .swift
//  MeetApp
//
//  Created by Николай Чунихин on 03.06.2023.
//

import SwiftUI

struct AuthCoordinatorView: View {
    
    @EnvironmentObject var coordinator: AuthCoordinator
    
    var body: some View {
        start()
    }
    
    
    func start() -> some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.performFlow(page: .login)
                .navigationDestination(for: AuthPage.self, destination: { page in
                    coordinator.performFlow(page: page)
                })
                .fullScreenCover(item: $coordinator.flow) { page in
                    coordinator.performFlow(page: page)
                }
            
        }
        
    }
    
}

struct AuthCoordinatorView__Previews: PreviewProvider {
    static var previews: some View {
        AuthCoordinatorView()
    }
}

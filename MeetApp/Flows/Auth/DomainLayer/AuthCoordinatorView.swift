//
//  AuthCoordinatorView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 02.06.2023.
//

import SwiftUI

struct AuthCoordinatorView: View {
    
    @EnvironmentObject: AuthCoordinator = coordinator
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AuthCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthCoordinatorView()
    }
}

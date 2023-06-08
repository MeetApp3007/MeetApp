//
//  ProfileView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

struct ProfileView: View {
    // MARK: Properties
    /// вьюМодель
    @EnvironmentObject var viewModel: ProfileViewModel
    
    // MARK: Body
    var body: some View {
        Text("Profile View")
            .font(.system(size: 24, weight: .semibold, design: .rounded))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

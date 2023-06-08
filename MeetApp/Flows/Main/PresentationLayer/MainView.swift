//
//  MainView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

struct MainView: View {
    // MARK: Properties
    /// вьюМодель
    @EnvironmentObject var viewModel: MainViewModel
    
    // MARK: Body
    var body: some View {
        Text("Main View")
            .font(.system(size: 24, weight: .semibold, design: .rounded))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

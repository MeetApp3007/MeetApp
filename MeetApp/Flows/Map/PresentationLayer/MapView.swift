//
//  MapView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

struct MapView: View {
    // MARK: Properties
    /// вьюМодель
    @EnvironmentObject var viewModel: MapViewModel
    
    // MARK: Body
    var body: some View {
        Text("Map View")
            .font(
                .system(
                    size: 24,
                    weight: .semibold,
                    design: .rounded
                )
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

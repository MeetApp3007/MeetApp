//
//  OnboardingView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: Properties
    /// вьюМодель
    @EnvironmentObject var viewModel: OnboardingViewModel
        
    // MARK: Body
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("OnBoarding")
                .font(
                    .system(
                        size: 32,
                        weight: .heavy,
                        design: .rounded
                    )
                )
                .foregroundColor(.green)
            Spacer()
            
            Button {
                viewModel.completeOnboarding()
            } label: {
                Text("Пройти онбординг")
                    .font(
                        .system(
                            size: 24,
                            weight: .semibold,
                            design: .rounded
                        )
                    )
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
                
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

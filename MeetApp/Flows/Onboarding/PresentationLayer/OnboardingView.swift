//
//  OnboardingView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("OnBoarding")
            Spacer()
            Button {
                viewModel.completeOnboarding()
            } label: {
                Text("Пройти онбординг")
            }
            Spacer()
        }
                
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

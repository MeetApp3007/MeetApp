//
//  AuthViewLogin.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import SwiftUI

struct LoginView: View {
    // MARK: Properties
    /// вьюМодель
    @EnvironmentObject var viewModel: LoginViewModel
    
    // MARK: Body
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Login")
                .font(
                    .system(
                        size: 32,
                        weight: .bold
                    )
                )
                .foregroundColor(.pink)
            
            Spacer()
            
            Button {
                viewModel.roadToRegisterScreen()
            } label: {
                Text("Register view")
                    .font(
                        .system(
                            size: 24
                        )
                    )
            }
            .buttonStyle(.bordered)
            
            Button {
                viewModel.login()
            } label: {
                Text("Войти")
                    .font(
                        .system(
                            size: 24
                        )
                    )
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

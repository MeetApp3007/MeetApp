//
//  RegisterView.swift
//  MeetApp
//
//  Created by Николай Чунихин on 03.06.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Register")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.pink)
            
            Spacer()
            
            Button {
                viewModel.roadToLoginScreen()
            } label: {
                Text("Login View")
                    .font(.system(size: 24))
            }
            .buttonStyle(.bordered)
            
            Button {
                viewModel.register()
            } label: {
                Text("Зарегистрироваться")
                    .font(.system(size: 24))
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

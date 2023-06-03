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
            Spacer()
            Button {
                viewModel.goLogin()
            } label: {
                Text("Login")
            }
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

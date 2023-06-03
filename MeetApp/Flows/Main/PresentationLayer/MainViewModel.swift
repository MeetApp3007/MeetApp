//
//  MainViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import Foundation

protocol MainViewModelProtocol{
    var title: String { get }
}

class MainViewModel: ObservableObject {}

extension MainViewModel: MainViewModelProtocol {
    var title: String {
        return "Главная"
    }
    
}


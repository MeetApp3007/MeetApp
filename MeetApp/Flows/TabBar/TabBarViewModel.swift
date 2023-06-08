//
//  TabBarViewModel.swift
//  MeetApp
//
//  Created by Николай Чунихин on 27.04.2023.
//

import Foundation

protocol TabBarScreenOutput {
    var main: () -> Void { get set }
    var map: () -> Void { get set }
    var profile: () -> Void { get set }
    
    func showMainScreen()
    func showMapScreen()
    func showProfileScreen()
}





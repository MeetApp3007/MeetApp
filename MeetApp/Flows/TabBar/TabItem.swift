//
//  TabItem.swift
//  MeetApp
//
//  Created by Николай Чунихин on 07.06.2023.
//

import Foundation
/// Модель таба
struct TabItem: Hashable {
    // MARK: Properties
    let imageName: String
    let title: String
    let type: TabItemType
    /// перечисление типов таба
    enum TabItemType {
        case maim
        case map
        case profile
    }
}

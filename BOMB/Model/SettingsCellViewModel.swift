//
//  SettingsCellViewModel.swift
//  BOMB
//
//  Created by Дарья Сотникова on 12.08.2023.
//

import Foundation

enum SettingsCellViewModel {
    case label(String)
    case timing(
        buttonLeftUp: String,
        buttonRightUp: String,
        buttonLeftDown: String,
        buttonRightDown: String
    )
    case labelAndSwitch(String, Bool)
    case labelAndList(String, [String])
}

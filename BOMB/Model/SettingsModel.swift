//
//  SettingsModel.swift
//  BOMB
//
//  Created by Дарья Сотникова on 12.08.2023.
//

import UIKit

struct SettingsModel {
    let settingsPageRows: [SettingsCellViewModel] = [
        .label("Время игры"),
        .timing(buttonLeftUp: "Короткое", buttonRightUp: "Среднее", buttonLeftDown: "Длинное", buttonRightDown: "Случайное"),
        .labelAndSwitch("Игра с Заданиями", true),
        .labelAndSwitch("Фоновая Музыка", true),
        .labelAndList("Фоновая Музыка", ["Мелодия 1", "Мелодия 2"]),
        .labelAndList("Тиканье Бомбы", ["Часы 1", "Часы 2"]),
        .labelAndList("Взрыв Бомбы", ["Взрыв 1", "Взрыв 2"])
    ]
}

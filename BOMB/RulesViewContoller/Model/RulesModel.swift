//
//  RulesModel.swift
//  BOMB
//
//  Created by Дарья Сотникова on 09.08.2023.
//

import UIKit

struct RulesModel {
    let rulesPageRows: [RulesCellViewModel] = [
        .title("Правила Игры"),
        .imageAndText(UIImage(named: "1"), "Все игроки становятся в круг."),
        .imageAndText(UIImage(named: "2"), "Первый игрок берет телефон и нажимает кнопку:"),
        .image(UIImage(named: "start-game-rules") ?? UIImage()),
        .imageAndText(UIImage(named: "3"), "На экране появляется вопрос. Например, «Назовите фрукт»."),
        .imageAndText(UIImage(named: "4"), "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие) участники"),
        .imageAndText(UIImage(named: "5"), "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба."),
        .imageAndText(UIImage(named: "6"), "Проигравшим считается тот, в чьих руках взорвалась бомба."),
        .imageAndText(UIImage(named: "7"), "Если в настройках выбран режим игры «С заданиями», то проигравший выполняет задание.")
    ]
    
    let categoriesPageRows: [RulesCellViewModel] = [
        .title("Категории"),
        .imageAndText(nil, "В игре доступно 5 категорий, в каждой из которых содержится 15 вопросов."),
        .imageAndText(nil, "Можно выбрать сразу несколько категорий для игры."),
        .twoImagesLabel(left: ("Мультфильмы", "🐶" ), right: ("География", "🧭")),
        .twoImagesLabel(left: ("Наука", "🔬"), right: ("Видеоигры", "🕹️")),
        .twoImagesLabel(left: ("Разное", "🌚"), right: nil)
    ]
    
    let settingsPageRows: [RulesCellViewModel] = [
        .title("Настройки"),
        .imageAndText(UIImage(named: "dot"), "В настройках игры можно задать время взрыва бомбы:"),
        .imageAndText(UIImage(named: "short"), "Бомба взорвётся в течение 10 секунд."),
        .imageAndText(UIImage(named: "middle"), "Бомба взорвётся в течение 20 секунд."),
        .imageAndText(UIImage(named: "long"), "Бомба взорвётся в течение 45 секунд."),
        .imageAndText(UIImage(named: "random"), "Бомба взорвётся в течение 10-45 секунд."),
        .imageAndText(UIImage(named: "dot"), "Если выбран режим «С заданиями», то после взрыва бомбы на экране будет появляться задание для проигравшего игрока."),
        .title("Tакже в настройках можно:"),
        .imageAndText(UIImage(named: "dot"), "Включить / Отключить фоновую музыку."),
        .imageAndText(UIImage(named: "dot"), "Выбрать звуки для фоновой музыки, тиканья бомбы и взрыва.")
    ]
}


//
//  RulesModel.swift
//  BOMB
//
//  Created by Дарья Сотникова on 09.08.2023.
//

import UIKit

struct RulesModel {
    let rows: [RulesCellViewModel] = [
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
}

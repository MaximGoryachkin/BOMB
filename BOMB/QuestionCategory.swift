//
//  Question.swift
//  BOMB
//
//  Created by Максим Горячкин on 08.08.2023.
//

struct QuestionCategory {
    let category: Category
    let questions: [String]
    var isChoose: Bool
}

enum Category: String {
    case multfilm = "Мультфильмы"
    case geography = "География"
    case science = "Наука"
}

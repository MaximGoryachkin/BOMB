//
//  Model.swift
//  BOMB
//
//  Created by Максим Горячкин on 08.08.2023.
//

struct QuestionModel {
    var multfilmCategory = QuestionCategory(name: .multfilm,
                                            questions: ["Мультфильм студии Дисней",
                                                        "Покемон первого поколения",
                                                        "Диснеевская принцесса",
                                                        "Персонаж аниме «Наруто»",
                                                        "Работа анимационной студии «Ghibli»",
                                                        "Мультсериал с длиной больше 100 серий",
                                                        "Аниме, где главный герой – обычный японский школьник",
                                                        "По мотивам видеоигр",
                                                        "Мультфильм, который разрушил ваше детство",
                                                        "Главный герой - животное",
                                                        "Шедевр студии «Союзмультфильм»",
                                                        "Мультфильм - мюзикл",
                                                        "По мотивам книг",
                                                        "Как проводили лето Финес и Ферб?",
                                                        "Экземпляр с возрастным ограничением 16+"],
                                            isChoose: false)
    
    var geographyCategory = QuestionCategory(name: .geography,
                                             questions: ["Представитель фауны Австралии",
                                                         "Гора Европы",
                                                         "Пролив в Африке",
                                                         "Страна на букву 'A'",
                                                         "Географический пояс",
                                                         "Озеро России",
                                                         "Столица на букву 'В'",
                                                         "Течение на земном шаре",
                                                         "Назовите полуостров",
                                                         "Река, через 2 страны",
                                                         "Северная область России",
                                                         "Город Германии",
                                                         "Страна Южной Америки",
                                                         "Остров Японии",
                                                         "Столица африканскиой страны"],
                                             isChoose: false)
    
    var scienceCategory = QuestionCategory(name: .science,
                                           questions: ["Самая классная область науки",
                                                       "Знаменитый ученый",
                                                       "Элементрарная частица",
                                                       "Единица длины",
                                                       "Часть человеческого тела",
                                                       "Химический элемент",
                                                       "Выдающийся философ",
                                                       "Физическая величина",
                                                       "Математический оператор",
                                                       "Соль - NaCl, следующий... ",
                                                       "Назови динозавра",
                                                       "Созвездие на небосводе",
                                                       "",
                                                       "",
                                                       ""],
                                           isChoose: false)
    
    mutating func chooseMultfilms(_: Bool) {
        multfilmCategory.isChoose.toggle()
    }
    
    mutating func chooseGeography(_: Bool) {
        geographyCategory.isChoose.toggle()
    }
    
    mutating func chooseScience(_: Bool) {
        scienceCategory.isChoose.toggle()
    }
    
    func setQuestion() -> String {
        var resultArray = [String]()
        var categories = [multfilmCategory, geographyCategory, scienceCategory]
        for category in categories {
            if category.isChoose {
                resultArray += category.questions
            }
        }
        return resultArray.randomElement() ?? ""
    }
}

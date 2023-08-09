//
//  Model.swift
//  BOMB
//
//  Created by Максим Горячкин on 08.08.2023.
//

struct QuestionModel {
    var multfilmCategorie = QuestionCategory(category: .multfilm,
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
    var geographyCategorie = QuestionCategory(category: .geography,
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
    var scienceCategorie = QuestionCategory(category: .science,
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
    
    func setQuestion() -> String {
        var resultArray = [String]()
        
        switch true {
        case multfilmCategorie.isChoose:
            resultArray += multfilmCategorie.questions
        case geographyCategorie.isChoose:
            resultArray += geographyCategorie.questions
        case scienceCategorie.isChoose:
            resultArray += scienceCategorie.questions
        default:
            print("Not match")
        }
        
        return resultArray.randomElement() ?? ""
    }
    
    mutating func update(categoryName: Category) {
        switch categoryName {
        case .multfilm:
            multfilmCategorie.isChoose.toggle()
        case .geography:
            geographyCategorie.isChoose.toggle()
        case .science:
            scienceCategorie.isChoose.toggle()
        }
        print("Model - \(multfilmCategorie.isChoose)")
        print(setQuestion())
    }
}

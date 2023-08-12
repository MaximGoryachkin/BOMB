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
                                                         "Мультфильм по мотивам видеоигр",
                                                         "Мультфильм, который разрушил ваше детство",
                                                         "Главный герой мультфильма - животное",
                                                         "Шедевр студии «Союзмультфильм»",
                                                         "Мультфильм - мюзикл",
                                                         "Мультфильм по мотивам книг",
                                                         "Как проводили лето Финес и Ферб?",
                                                         "Мультфильм с возрастным ограничением 16+"],
                                             isChoose: true,
                                             imageName: nil)
    var geographyCategorie = QuestionCategory(category: .geography,
                                              questions: ["Представитель фауны Австралии",
                                                          "Гора Европы",
                                                          "Пролив в Африке",
                                                          "Страна на букву 'A'",
                                                          "Географический пояс",
                                                          "Озеро России",
                                                          "Столица страны на букву 'В'",
                                                          "Название течения на земном шаре",
                                                          "Назовите полуостров",
                                                          "Назовите реку, через 2 страны",
                                                          "Назовите северную область России",
                                                          "Назовите город Германии",
                                                          "Назовите страну Южной Америки",
                                                          "Назовите остров Японии",
                                                          "Назовите столицу африканскиой страны"],
                                              isChoose: true,
                                              imageName: nil)
    var scienceCategorie = QuestionCategory(category: .science,
                                            questions: ["Самая классная область науки",
                                                        "Назовите знаменитого ученого",
                                                        "Назовите элементрарную частицу",
                                                        "Самая большая единица длины",
                                                        "Самая маленькаяя часть человеческого тела",
                                                        "Самый распространенный химический элемент",
                                                        "Выдающийся философ",
                                                        "Необычная физическая величина, которую вы знаете",
                                                        "Самый непонятный математический оператор",
                                                        "Соль - NaCl, следующий... ",
                                                        "Назови динозавра",
                                                        "Созвездие на небосводе со странным названием",
                                                        "Важнейшие для человека микроэлементы",
                                                        "Представитель отряда кошачьих",
                                                        "Назови число, равное 2 в любой степени"
                                                       ],
                                            isChoose: true,
                                            imageName: nil)
    var videogameCategory = QuestionCategory(category: .videogame,
                                             questions: ["Персонаж восьмибитной игры",
                                                         "Шутер от первого лица",
                                                         "",
                                                         "",
                                                         "",
                                                         "",
                                                         "",
                                                         "",
                                                         "",
                                                         "",
                                                         "",
                                                         "",
                                                         "",
                                                         "",
                                                         ""
                                                        ],
                                             isChoose: true,
                                             imageName: nil)
    var otherCategory = QuestionCategory(category: .other,
                                         questions: ["Назовите домашнее животное",
                                                     "Перечислите числа Фибоначчи",
                                                     "Назовите британского актера",
                                                     "Какие уроки бывают в школе?",
                                                     "Назовите книгу Терри Пратчетта",
                                                     "Назовите маскота различных брендов",
                                                     "Назовите футбольную команду",
                                                     "Назовите страну, которая организовывала Олимпийские Игры",
                                                     "Назовите поэта Серебряного века",
                                                     "Назовите сказку Х.К. Андерсена",
                                                     "Назовите растение, которое растет в России",
                                                     "Назовите творческую профессию",
                                                     "Назовите хищное животное",
                                                     "Назовите спортивный бренд",
                                                     "Назовите фильм, снятый по мотивам литературных произведений"
                                                    ],
                                         isChoose: true,
                                         imageName: nil)
    
    
    var punishments = [
        "Когда кто-то произносит слово, в котором есть буква «А»/«О»/«Е», щелкать пальцами",
        "В следующем раунде все ответы давать очень высоким/низким голосом",
        "Рассказать стихотворение",
        "Спеть песню в стиле Боярского",
        "Отжаться 10 раз на одной руке",
        "Рассказать анекдот про Василия Ивановича и Петьку",
        "Станцевать танец маленьких утят",
        "Сильно улыбаться весь следующий раунд",
        "Расхваливай себя в течение минуты",
        "Изобрази мультяшного персонажа"
    ]
    
    var resultArray = [String]()
    
    mutating func setQuestion() -> String {
        guard let index = (0..<resultArray.count).randomElement() else { return "Question is end" }
        return resultArray.remove(at: index)
    }
    
    mutating func addQuestions() {
        resultArray = []
        
        if multfilmCategorie.isChoose {
            resultArray += multfilmCategorie.questions
        }
        if geographyCategorie.isChoose {
            resultArray += geographyCategorie.questions
        }
        if scienceCategorie.isChoose {
            resultArray += scienceCategorie.questions
        }
    }
    
    mutating func update(categoryName: String) {
        switch categoryName {
        case Category.multfilm.rawValue:
            multfilmCategorie.isChoose.toggle()
        case Category.geography.rawValue:
            geographyCategorie.isChoose.toggle()
        case Category.science.rawValue:
            scienceCategorie.isChoose.toggle()
        default:
            print("Not match")
        }
        print(scienceCategorie.isChoose)
    }
    
    mutating func setPunishment() -> String {
        guard let index = (0..<punishments.count).randomElement() else { return "Punishments is end" }
        return punishments.remove(at: index)
    }
    
}

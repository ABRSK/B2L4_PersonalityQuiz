//
//  Question.swift
//  B2L4_PersonalityQuiz
//
//  Created by Андрей Барсук on 28.03.2022.
//

struct Question {
  let title: String
  let type: ResponseType
  let answers: [Answer]
  
  static func getQuestions() -> [Question] {
    [
      Question(
        title: "Какую пищу вы предпочитаете?",
        type: .single,
        answers: [
          Answer(title: "Стейк", animal: .dog),
          Answer(title: "Рыба", animal: .cat),
          Answer(title: "Морковь", animal: .rabbit),
          Answer(title: "Кукуруза", animal: .turtle)
        ]
      ),
      Question(
        title: "Что вам нравится больше?",
        type: .multiple,
        answers: [
          Answer(title: "Плавать", animal: .dog),
          Answer(title: "Спать", animal: .cat),
          Answer(title: "Обниматься", animal: .rabbit),
          Answer(title: "Есть", animal: .turtle)
        ]
      ),
      Question(
        title: "Любите ли вы поездки на машине?",
        type: .ranged,
        answers: [
          Answer(title: "Ненавижу", animal: .cat),
          Answer(title: "Нервничаю", animal: .rabbit),
          Answer(title: "Не замечаю", animal: .turtle),
          Answer(title: "Обожаю", animal: .dog)
        ]
      )
    ]
  }
}

struct Answer {
  let title: String
  let animal: Animal
}

enum ResponseType {
  case single
  case multiple
  case ranged
}

enum Animal: Character {
  case dog = "🐶"
  case cat = "🐱"
  case rabbit = "🐰"
  case turtle = "🐢"
  
  var description: String {
    switch self {
    case .dog:
      return "Curabitur tincidunt est sed tortor molestie fringilla. Duis vel tristique turpis. Praesent porttitor est sed nunc rutrum lacinia. Quisque diam velit, egestas congue posuere non, mollis non sem. Mauris ultrices id orci vitae vulputate. Pellentesque eget tellus mollis, aliquet risus et, semper magna."
    case .cat:
      return "Morbi tincidunt sollicitudin ex, nec porttitor tortor commodo id. Vestibulum volutpat massa et blandit consequat. Proin fringilla, urna in feugiat pellentesque, justo augue egestas odio, et auctor lacus dui sit amet libero."
    case .rabbit:
      return "Pellentesque arcu augue, iaculis ut ex eu, lacinia pharetra libero. Ut ultrices aliquet ipsum et malesuada. Donec dignissim semper leo egestas gravida. Sed at malesuada leo. Aenean lacinia ullamcorper sem vel vehicula. Cras rhoncus mattis lacus nec fermentum."
    case .turtle:
      return "Aenean at ex consequat, finibus nisi ut, fermentum orci. Sed blandit est sit amet lacus volutpat, vitae facilisis lectus fermentum. Pellentesque consectetur nibh a rhoncus tristique. Nam erat ipsum, rhoncus sit amet rhoncus sit amet, elementum nec mi."
    }
  }
}

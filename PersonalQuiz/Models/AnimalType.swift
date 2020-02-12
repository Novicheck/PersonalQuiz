//
//  AnimalType.swift
//  PersonalQuiz
//
//  Created by Denis on 12.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var difinition: String {
        switch self {
            case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
            case .cat:
            return"Вы сами себе на уме. Любите гулть сами по себе. Вы цените одиночество."
            case .rabbit:
            return "Вам нарвится все мягкое. Вы здоровы и полны энергии."
            case .turtle:
            return "Ваша сила в мудрости. Неторопливый и рассудительный выигрывает на больших расстояниях"
        }
    }
}

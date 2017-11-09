//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Max Steward on 09/11/2017.
//  Copyright © 2017 StewardStudios. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. surround yourself with people you love and you enjoy activities with your friends"
        case .cat:
            return "Mischeavous, yet mild tempered, you prefer to do things on your terms"
        case .rabbit:
            return "you love everything that's soft. You are healthy and full of energy"
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race"
        }
    }
}

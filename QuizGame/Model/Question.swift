//
//  Question.swift
//  QuizGame
//
//  Created by Winston Yang on 2023-08-30.
//

import Foundation


struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}

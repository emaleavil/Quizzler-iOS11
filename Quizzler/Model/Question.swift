//
//  File.swift
//  Quizzler
//
//  Created by Emanuel on 21/3/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//
import Foundation

struct Question {
    
    let questionText : String
    let answer : Bool

    init(text :  String, correctAnswer : Bool) {
        self.questionText = text
        self.answer = correctAnswer
    }
}

//
//  Question.swift
//  millionaire
//
//  Created by Louise Chan on 2020-03-18.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answer: (String?, String?)
    var wrongAnswers: [(String?, String?)]   // Contains the other 3 incorrect answers
    
    init(question: String, ans: (String?, String?) , wrongAns: [(String?, String?)]) {
        self.question = question
        self.answer = ans
        self.wrongAnswers = wrongAns
    }
    
    func getQuestion() -> String {
        return question
    }

    func getChoices() -> [String?] {
        var choices = [answer.0]
        for (c, _) in wrongAnswers {
            choices.append(c)
        }
        return choices
    }

    func getChoicesWithExtraInfo() -> [(choice: String?, extraInfo: String?)] {
        return [answer] + wrongAnswers
    }
    
    func getAnswer() -> String {
        return answer.0 ?? ""
    }
}

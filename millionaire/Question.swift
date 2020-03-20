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
    let answer: String
    let otherChoices: [String]
    var choices: [(String?, String?)]   // Contains the other shuffled choices to display including the correct answer
    
    init(question: String, answer: String, otherChoices: [String]) {
        self.question = question
        self.answer = answer
        self.otherChoices = otherChoices
        self.choices = []
        resetChoices()
    }
    
    func getQuestion() -> String {
        return question
    }

    func getChoices() -> [String?] {
        var choiceRet = [String?]()
        for (c, _) in self.choices {
            choiceRet.append(c)
        }
        return choiceRet
    }

    func getChoicesWithExtraInfo() -> [(choice: String?, extraInfo: String?)] {
        return choices
    }
    
    func getAnswer() -> String {
        return answer
    }
    
    mutating func resetChoices() {
        // TODO Check if necessary to reset array contents

        // assemble the choices and shuffle them
        self.choices = [(self.answer, nil)]
        for oc in otherChoices {
            self.choices.append((oc, nil))
        }
        self.choices.shuffle()

    }
}

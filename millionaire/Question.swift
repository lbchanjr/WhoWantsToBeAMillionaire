//
//  Question.swift
//  millionaire
//
//  Description: Used to contain a question and its possible answers (randomly shuffled).
//
//  Created by Louise Chan on 2020-03-18.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

struct Question {
    let question: String                // This will contain the question to be asked
    let answer: String                  // This will contain the correct answer to the question
    let otherChoices: [String]          // This will contain the other answers (albeit wrong) to the question
    var choices: [(String?, String?)]   // Contains the other shuffled choices to display including the correct answer
    
    // Constructor for this class.
    init(question: String, answer: String, otherChoices: [String]) {
        self.question = question
        self.answer = answer
        self.otherChoices = otherChoices
        self.choices = []
        resetChoices()
    }
    
    // Returns the question that is being asked.
    func getQuestion() -> String {
        return question
    }

    // Returns an array of strings containing the possible answers to the question
    func getChoices() -> [String?] {
        var choiceRet = [String?]()
        for (c, _) in self.choices {
            choiceRet.append(c)
        }
        return choiceRet
    }

    // Returns an array of tuples containing answers to the question, each with additional info.
    // The extraInfo variable (i.e. additional info) is used to store the results
    // of the Ask the audience lifeline otherwise, this tuple element will be set to nil.
    func getChoicesWithExtraInfo() -> [(choice: String?, extraInfo: String?)] {
        return choices
    }
    
    // Returns the correct answer to the question
    func getAnswer() -> String {
        return answer
    }
    
    // Reload and reshuffle all the possible answers to the question
    // Any modifications done by the 50:50 lifeline will be discarded.
    mutating func resetChoices() {
        // assemble the choices and shuffle them
        self.choices = [(self.answer, nil)]
        for oc in otherChoices {
            self.choices.append((oc, nil))
        }
        self.choices.shuffle()

    }
}

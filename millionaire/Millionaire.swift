//
//  Millionaire.swift
//  millionaire
//
//  Created by Louise Chan on 2020-03-18.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

enum QuestionException: Error {
    case NotEnoughEasyQuestions
    case NotEnoughHardQuestions
}

enum Difficulty {
    case EASY, HARD
}

class Millionaire {
    let easyNumLevels: Int
    let hardNumLevels: Int
    
    var questions = [Question]()
    var difficulty: Difficulty
    var playerName: String?
    var numLevels: Int
    
    var currentLevel = 1
    var prizeMoney = 0.0
    
    init(easyLevels: Int, hardLevels: Int, diff: Difficulty) {
        self.easyNumLevels = easyLevels
        self.hardNumLevels = hardLevels
        self.difficulty = diff

        if difficulty == Difficulty.EASY {
            numLevels = easyNumLevels
        }
        else {
            numLevels = hardNumLevels
        }
        
        currentLevel = 1
    }
    
    convenience init(difficulty: Difficulty) {
        self.init(easyLevels: 9, hardLevels: 15, diff: difficulty)
    }
    
    func loadQuestions(easyQuestions: [Question], hardQuestions: [Question]) throws {
        let easyQuestionsCount: Int
        let hardQuestionsCount: Int
        if difficulty == Difficulty.EASY {
            // For easy level, questions will be 2/3 easy and 1/3 hard
            easyQuestionsCount = (easyNumLevels * 2) / 3
            hardQuestionsCount = easyNumLevels - easyQuestionsCount
        }
        else {
            // For hard level, questions will be 3/5 easry and 2/5 hard
            easyQuestionsCount = (hardNumLevels * 3) / 5
            hardQuestionsCount = hardNumLevels - easyQuestionsCount
        }
        
        guard easyQuestions.count >= easyQuestionsCount else {
            throw QuestionException.NotEnoughEasyQuestions
        }
        
        guard hardQuestions.count >= hardQuestionsCount else {
            throw QuestionException.NotEnoughHardQuestions
        }

        let shuffledEasyQ = shuffleQuestions(q: easyQuestions)
        let shuffledHardQ = shuffleQuestions(q: hardQuestions)

        questions.removeAll()
        questions += shuffledEasyQ[0..<easyQuestionsCount]
        questions += shuffledHardQ[0..<hardQuestionsCount]
    }
    
    
    func shuffleQuestions(q: [Question]) -> [Question] {
        return q.shuffled()
    }
    
}

//
//  Millionaire.swift
//  millionaire
//
//  Created by Louise Chan on 2020-03-18.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

class Millionaire {
    let easyNumLevels: Int
    let hardNumLevels: Int
    let lifeLineLevel: Int
    
    var questions = [Question]()
    var lifeLines:[LifeLineTypes:LifeLine] = [:]
    var levelCashPrizes = [Int]()
    let difficulty: Difficulty
    var playerName: String?
    let numLevels: Int
    
    var currentLevel = 0            // first level starts at 0
    var prizeMoney = 0
    
    init(easyLevels: Int, hardLevels: Int, diff: Difficulty, lifeLineStart: Int) {
        self.easyNumLevels = easyLevels
        self.hardNumLevels = hardLevels
        self.lifeLineLevel = lifeLineStart - 1    // starts at 1 so we need to subtract by 1 to match
                                                  // convention used within the class
        self.difficulty = diff

        if difficulty == Difficulty.EASY {
            numLevels = easyNumLevels
        }
        else {
            numLevels = hardNumLevels
        }
    }
    
    convenience init(difficulty: Difficulty) {
        
        var lifeLineLevel = 1
        if difficulty == Difficulty.HARD {
            lifeLineLevel = 6
        }
        
        self.init(easyLevels: 9, hardLevels: 15, diff: difficulty, lifeLineStart: lifeLineLevel)
        
        if (lifeLineLevel - 1) == currentLevel {
            loadLifeLines()
        }
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
    
    func loadCashPrizes(levelPrizes: [Int]) throws {
        guard levelPrizes.count == numLevels else {
            throw PrizeLevelException.CashPrizeLevelMismatch("Number of cash prizes does not match the number of levels")
        }
        
        self.levelCashPrizes = levelPrizes
    }
    
    func loadLifeLines() {
        let lifeline1 = LifeLine5050()
        let lifeline2 = LifeLineAudience()
        let lifeline3 = LifeLinePhoneAFriend()
        
        lifeLines[LifeLineTypes.FiftyFifty] = lifeline1
        lifeLines[LifeLineTypes.AudiencePoll] = lifeline2
        lifeLines[LifeLineTypes.PhoneAFriend] = lifeline3
    }
    
    func answerQuestion(answer: String) throws -> GameStatus {
        guard questions.isEmpty == false else {
            throw QuestionException.NoQuestionsLoaded("No questions have been loaded for this game. Use loadQuestions() method to fix this problem")
        }
        
        guard levelCashPrizes.isEmpty == false else {
            throw PrizeLevelException.NoCashPrizesLoaded("No cash prizes loaded for the game. Use loadCashPrizes() method to fix this problem")
        }
        
        // Check if answer matches the one that is stored in question
        if answer == questions[currentLevel].answer {
            prizeMoney = levelCashPrizes[currentLevel]
            currentLevel += 1
            
            // Check if there's a need to load lifelines
            if lifeLines.isEmpty && currentLevel == lifeLineLevel {
                loadLifeLines()
            }
            
            let levelsPerRound = numLevels / 3
            if currentLevel%levelsPerRound == 0 && currentLevel/levelsPerRound <= 2 {
                return GameStatus.GameLevelUpWithWalkAway
            }
            else if currentLevel == numLevels {
                return GameStatus.GameOverYouWin
            }
            else {
                return GameStatus.GameLevelUp
            }
        }
        else {
            // Wrong answer
            prizeMoney = 0
            return GameStatus.GameOverYouLost
        }
    }
    
    func useLifeLine(lifelineType: LifeLineTypes) -> Question? {
        guard let lifeline = lifeLines[lifelineType] else {
            return nil
        }
        // Remove lifeline from dictionary since it is already used
        lifeLines[lifelineType] = nil
        return lifeline.processLifeLine(q: questions[currentLevel])
    }
    
    func updateCurrentLevelQuestion(newQuestion: Question) {
        questions[currentLevel] = newQuestion
    }
    
    func getLifeLines() -> [LifeLineTypes : LifeLine] {
        return lifeLines
    }
    
    func getPrizeMoney() -> Int {
        return prizeMoney
    }
    
    func getCurrentLevel() -> Int {
        return (currentLevel + 1)
    }
    
    func getCurrentLevelCashPrize() throws -> Int {
        guard levelCashPrizes.isEmpty == false else {
            throw PrizeLevelException.NoCashPrizesLoaded("No cash prizes loaded for the game. Use loadCashPrizes() method to fix this problem")
        }
        
        return levelCashPrizes[currentLevel]
    }
    
    func getCashPrizeAtLevel(level: Int) throws -> Int {
        guard level < levelCashPrizes.count else {
            throw PrizeLevelException.LevelIsOutOfRange
        }
        
        return levelCashPrizes[level]
    }
    
    func getCurrentQuestion() -> Question {
        return questions[currentLevel]
    }
    
    func shuffleQuestions(q: [Question]) -> [Question] {
        return q.shuffled()
    }
    
}

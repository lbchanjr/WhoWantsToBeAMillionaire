//
//  Millionaire.swift
//  millionaire
//  Description: Game engine for the "Who wants to be a Millionaire?" game.
//               This class is completely isolated from the UI component of the application
//               making the porting of the game to other Swift-based platforms (e.g. iOS)
//               very easy.
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
    
    // Default constructor of the game engine
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
    
    // Convenience constructor for the game engine
    convenience init(difficulty: Difficulty) {
        
        // For EASY level, lifelines are available immediately
        var lifeLineLevel = 1
        // For HARD level, lifelines will be available starting in Round 2 or level 6 of the game
        if difficulty == Difficulty.HARD {
            lifeLineLevel = 6
        }
        
        // Set 9 levels for EASY mode and 15 levels for HARD mode.
        self.init(easyLevels: 9, hardLevels: 15, diff: difficulty, lifeLineStart: lifeLineLevel)
        
        // Check if lifeline needs to be loaded at instance creation (i.e. EASY mode)
        if (lifeLineLevel - 1) == currentLevel {
            loadLifeLines()
        }
    }
    
    // Allow loading of questions that will be used for the game.
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
        
        // These guard statements ensures that an exception will be thrown
        // if there are not enough questions that are available for the game.
        
        guard easyQuestions.count >= easyQuestionsCount else {
            throw QuestionException.NotEnoughEasyQuestions
        }
        
        guard hardQuestions.count >= hardQuestionsCount else {
            throw QuestionException.NotEnoughHardQuestions
        }

        // Shuffle all question so that game will start with different set of questions
        // each time the app is run.
        let shuffledEasyQ = shuffleQuestions(q: easyQuestions)
        let shuffledHardQ = shuffleQuestions(q: hardQuestions)

        // Initialize questions array for the game engine and load selected questions
        // from the data.swift file.
        questions.removeAll()
        questions += shuffledEasyQ[0..<easyQuestionsCount]
        questions += shuffledHardQ[0..<hardQuestionsCount]
    }
    
    // Loads the available cash prizes for every level of the game.
    func loadCashPrizes(levelPrizes: [Int]) throws {
        
        // Ensure the prizes coincide with the number of levels available for the game.
        guard levelPrizes.count == numLevels else {
            throw PrizeLevelException.CashPrizeLevelMismatch("Number of cash prizes does not match the number of levels")
        }
        
        // Save a copy of the prizes for all levels
        self.levelCashPrizes = levelPrizes
    }
    
    // Loads the 3 types of lifelines available for this game.
    func loadLifeLines() {
        let lifeline1 = LifeLine5050()
        let lifeline2 = LifeLineAudience()
        let lifeline3 = LifeLinePhoneAFriend()
        
        lifeLines[LifeLineTypes.FiftyFifty] = lifeline1
        lifeLines[LifeLineTypes.AudiencePoll] = lifeline2
        lifeLines[LifeLineTypes.PhoneAFriend] = lifeline3
    }
    
    // Allows the engine to process the selected answer provided by the player.
    func answerQuestion(answer: String) throws -> GameStatus {
        
        // Throw exceptions if there are problems with the questions or prizes that were loaded.
        
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
            
            // Provide the correct game status after processing the correct answer.
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
            // Wrong answer, inform app by updating the game status.
            prizeMoney = 0
            return GameStatus.GameOverYouLost
        }
    }
    
    // Process lifeline selected by the user by applying it to the question being asked.
    func useLifeLine(lifelineType: LifeLineTypes) -> Question? {
        // Return nil if no lifelines are available
        guard let lifeline = lifeLines[lifelineType] else {
            return nil
        }
        
        // Remove lifeline from dictionary since it is already used
        lifeLines[lifelineType] = nil
        return lifeline.processLifeLine(q: questions[currentLevel])
    }
    
    // Update question on current level (utilized to update choices when 50:50 lifeline is used)
    func updateCurrentLevelQuestion(newQuestion: Question) {
        questions[currentLevel] = newQuestion
    }
    
    // Get available lifelines in the game
    func getLifeLines() -> [LifeLineTypes : LifeLine] {
        return lifeLines
    }
    
    // Return the money the player can possibly win as of the current game level.
    func getPrizeMoney() -> Int {
        return prizeMoney
    }
    
    // Get the current level of the game.
    func getCurrentLevel() -> Int {
        return (currentLevel + 1)
    }
    
    // Get the cash prize for the current level
    func getCurrentLevelCashPrize() throws -> Int {
        guard levelCashPrizes.isEmpty == false else {
            throw PrizeLevelException.NoCashPrizesLoaded("No cash prizes loaded for the game. Use loadCashPrizes() method to fix this problem")
        }
        
        return levelCashPrizes[currentLevel]
    }
    
    // Get the cash prize for a specified level
    func getCashPrizeAtLevel(level: Int) throws -> Int {
        guard level < levelCashPrizes.count else {
            throw PrizeLevelException.LevelIsOutOfRange
        }
        
        return levelCashPrizes[level]
    }
    
    // Get the question being asked for the current level
    func getCurrentQuestion() -> Question {
        return questions[currentLevel]
    }
    
    // Shuffle a set of questions that are provided to the game engine.
    func shuffleQuestions(q: [Question]) -> [Question] {
        return q.shuffled()
    }
    
}

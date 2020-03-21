//
//  main.swift
//  millionaire
//
//  Created by Louise Chan on 2020-03-18.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

print("+-------------------------------------------------------+")
print("|          WHO WANTS TO BE A MILLIONAIRE? v1.0          |")
print("+-------------------------------------------------------+\n")

let gameDiff = promptGameDifficulty()
var gameOpt: Millionaire? = nil

// Instantiate game based on selected difficulty
if gameDiff == "E" {
   gameOpt = Millionaire(difficulty: Difficulty.EASY)
} else if gameDiff == "H" {
   gameOpt = Millionaire(difficulty: Difficulty.HARD)
}

if let game = gameOpt {
    do {
        if gameDiff == "E" {
            try game.loadCashPrizes(levelPrizes: easyPrizeMoneyArray)
        } else {
            try game.loadCashPrizes(levelPrizes: hardPrizeMoneyArray)
        }
    
        try game.loadQuestions(easyQuestions: easyQuestionsArray, hardQuestions: hardQuestionsArray)
        
    } catch {
        print("Exception thrown: \(error)")
    }

    var gameStatus: GameStatus? = nil

    var levelPrize = 0
    var lifelines: [LifeLineTypes : LifeLine] = [:]
    var lifelineSelected: LifeLineTypes? = nil
    var lifelineResult: Question? = nil
    
    repeat {
    
        do {
            levelPrize = try game.getCurrentLevelCashPrize()
        } catch {
            print("Exception thrown: \(error)")
        }
    
        let curQuestion = game.getCurrentQuestion()
        let curLevel = game.getCurrentLevel()
        lifelines = game.getLifeLines()
        let lifelineCount = lifelines.count
    
        if lifelineSelected == nil || lifelineSelected == LifeLineTypes.FiftyFifty {
            if gameStatus != GameStatus.GameNoLevelChange {
                showData(question: curQuestion, level: curLevel, prize: levelPrize, lifelines: lifelineCount, diff: (gameDiff == "E" ? "Easy" : "Hard"))
            }
        } else if lifelineSelected == LifeLineTypes.AudiencePoll {
            if let llQuestion = lifelineResult {
                showData(question: llQuestion, level: curLevel, prize: levelPrize, lifelines: lifelineCount, diff: (gameDiff == "E" ? "Easy" : "Hard"))
            }
        } else if lifelineSelected == LifeLineTypes.PhoneAFriend {
            print("\n*** Your friend suggests that you choose: \"", terminator: "")
            let arrChar = ["<A> ", "<B> ", "<C> ", "<D> "]
            if let llQuestion = lifelineResult {
                for i in 0..<llQuestion.choices.count {
                    if let friendAns = llQuestion.choices[i].0 {
                        print(arrChar[i] + friendAns + "\" ***")
                    }
                }
            }
        }
        
        let ans = promptAnswer()
    
        if ans == "L" {
            // Check if there are available lifelines to use
            lifelineSelected = nil
            
            if lifelineCount == 0 {
                print("\n\t*** No lifelines are available! Try again. ***")
                gameStatus = GameStatus.GameNoLevelChange
            }
            else {
                lifelineSelected = promptLifeLines(ll: lifelines)
                if let llQuestion = game.useLifeLine(lifelineType: lifelineSelected!) {
                    lifelineResult = llQuestion
                    if lifelineSelected! == LifeLineTypes.FiftyFifty {
                        game.updateCurrentLevelQuestion(newQuestion: llQuestion)
                    }
                }
            }
        } else {
            lifelineSelected = nil
            gameStatus = GameStatus.GameNoLevelChange       // assume that no level change will happen
            let curQuestionChoices = game.getCurrentQuestion().getChoices()
            if (ans == "A" && curQuestionChoices[0] == nil) || (ans == "B" && curQuestionChoices[1] == nil) ||
                (ans == "C" && curQuestionChoices[2] == nil) || (ans == "D" && curQuestionChoices[3] == nil) {
                print("\n\t*** This choice has already been eliminated using the 50/50 lifeline. Try again. ***")
            } else {
                let finalAnsChoice = promptFinalAnswer()
                if finalAnsChoice == "Y" {
                    let ansString = "ABCD"
                    if let choiceOffset = ansString.firstIndex(of: Character(ans))?.utf16Offset(in: ansString) {
                        gameStatus = try game.answerQuestion(answer: curQuestionChoices[choiceOffset]!)
                        
                        if gameStatus != GameStatus.GameOverYouLost {
                            print("\n\t*** You chose the right answer! Proceeding to next level... ***")
                        }
                        // Check if we can offer user to walk away or continue with the game.
                        if gameStatus == GameStatus.GameLevelUpWithWalkAway {
                            let walkawayResult = promptWalkAway(walkAwayCash: game.getPrizeMoney())
                            if walkawayResult == "W" {
                                break;
                            }
                        }
                    }
                }
            }
        }
    } while gameStatus != GameStatus.GameOverYouLost && gameStatus != GameStatus.GameOverYouWin
    
    if let gameResult = gameStatus {
        print("")
        switch gameResult {
        case .GameLevelUpWithWalkAway:
            print("*********************************************")
            print(" Congratulations!")
            print(" You are walking away with $\(game.getPrizeMoney()).")
            print("*********************************************")
        case .GameOverYouLost:
            print("*********************************************")
            print(" Sorry, your answer was incorrect. You lost.")
            print(" You didn't win any money.")
            print("*********************************************")
        case .GameOverYouWin:
            print("*********************************************")
            print(" Congratulations! You are now a millionaire.")
            print(" You won $1,000,000!")
            print("*********************************************")
        default:
            print("Game exitted abnormally.")
        }
        print("\nGAME OVER!")
    }
}

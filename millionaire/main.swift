//
//  main.swift
//  millionaire
//
//  Description: UI component of the game.
// 
//  Created by Louise Chan on 2020-03-18.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

// Display game banner.
print("+-------------------------------------------------------+")
print("|          WHO WANTS TO BE A MILLIONAIRE? v1.0          |")
print("+-------------------------------------------------------+")

// Prompt user for game difficulty (easy or hard)
let gameDiff = promptGameDifficulty()
var gameOpt: Millionaire? = nil

// Instantiate game based on selected difficulty
if gameDiff == "E" {
   gameOpt = Millionaire(difficulty: Difficulty.EASY)
} else if gameDiff == "H" {
   gameOpt = Millionaire(difficulty: Difficulty.HARD)
}

// Start game only if game instance was created successfuly.
if let game = gameOpt {
    do {
        // Load cash prizes depending on the difficulty level that was selected.
        if gameDiff == "E" {
            try game.loadCashPrizes(levelPrizes: easyPrizeMoneyArray)
        } else {
            try game.loadCashPrizes(levelPrizes: hardPrizeMoneyArray)
        }
    
        // Load the questions depending on the difficulty level that was selected.
        try game.loadQuestions(easyQuestions: easyQuestionsArray, hardQuestions: difficultQuestionsArray)
        
    } catch {
        // Just in case an exception occurs, print the exception error message.
        print("Exception thrown: \(error)")
    }

    // Initialize game variables before starting the game.
    var gameStatus: GameStatus? = nil
    var levelPrize = 0
    var lifelines: [LifeLineTypes : LifeLine] = [:]
    var lifelineSelected: LifeLineTypes? = nil
    var lifelineResult: Question? = nil
    
    // This loop will display the questions on different levels until the player wins,
    // lose or walks away from the game.
    repeat {
    
        // Get the cash prize offered for the level
        do {
            levelPrize = try game.getCurrentLevelCashPrize()
        } catch {
            // Exception not likely to happen at this point, but in case it does,
            // just print the error message
            print("Exception thrown: \(error)")
        }
    
        // Get all the necessary data to be used in displaying the current level question
        // and its possible answers as well as other relevant data such as lifeline info.
        let curQuestion = game.getCurrentQuestion()
        let curLevel = game.getCurrentLevel()
        lifelines = game.getLifeLines()
        let lifelineCount = lifelines.count
    
        // Check what data to display depending on the game status or the lifeline that was selected
        if lifelineSelected == nil || lifelineSelected == LifeLineTypes.FiftyFifty {
            // Process fifty-fifty lifeline display or default game level display.
            if gameStatus != GameStatus.GameNoLevelChange {
                showData(question: curQuestion, level: curLevel, prize: levelPrize, lifelines: lifelineCount, diff: (gameDiff == "E" ? "Easy" : "Hard"))
            }
        } else if lifelineSelected == LifeLineTypes.AudiencePoll {
            // Show audience polling info after selecting the Ask the audience lifeline.
            if let llQuestion = lifelineResult {
                showData(question: llQuestion, level: curLevel, prize: levelPrize, lifelines: lifelineCount, diff: (gameDiff == "E" ? "Easy" : "Hard"))
            }
        } else if lifelineSelected == LifeLineTypes.PhoneAFriend {
            // Display information after the Phone a Friend lifeline is used.
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
        
        // Display prompt so that player can choose whether to answer the question or use a lifeline.
        let ans = promptAnswer()
    
        // Check if player wishes to use a lifeline.
        if ans == "L" {
            // Check if there are available lifelines to use
            lifelineSelected = nil
            
            // Check if there are available lifelines
            if lifelineCount == 0 {
                // No lifelines available, display error message.
                print("\n\t*** No lifelines are available! Try again. ***")
                gameStatus = GameStatus.GameNoLevelChange
            }
            else {
                // Lifeline(s) is (or are) available, prompt user to choose a lifeline to use.
                lifelineSelected = promptLifeLines(ll: lifelines)
                // Use selected lifeline.
                if let llQuestion = game.useLifeLine(lifelineType: lifelineSelected!) {
                    // Lifeline was processed successfuly, a copy of the question with
                    // updated answer choices will be provided.
                    lifelineResult = llQuestion
                    
                    // Check if there's a need to update the current level question and possible answers
                    // (Note: applicable only if 50:50 lifeline is used.)
                    if lifelineSelected! == LifeLineTypes.FiftyFifty {
                        // Update current level's question with fifty-fifty lifeline choices.
                        game.updateCurrentLevelQuestion(newQuestion: llQuestion)
                    }
                }
            }
        } else {
            // Invalidate selected lifeline variable if any of the possible answers are chosen
            lifelineSelected = nil
            gameStatus = GameStatus.GameNoLevelChange       // assume that no level change will happen
            
            // Check if chosen answer is a valid one
            // (Note: It is still possible for user to choose an answer that is already eliminated by 50:50 lifeline)
            let curQuestionChoices = game.getCurrentQuestion().getChoices()
            if (ans == "A" && curQuestionChoices[0] == nil) || (ans == "B" && curQuestionChoices[1] == nil) ||
                (ans == "C" && curQuestionChoices[2] == nil) || (ans == "D" && curQuestionChoices[3] == nil) {
                print("\n\t*** This choice has already been eliminated using the 50/50 lifeline. Try again. ***")
            } else {
                // Valid choice was selected by used, ask user if this is the final answer
                let finalAnsChoice = promptFinalAnswer()
                if finalAnsChoice == "Y" {
                    // Process answer by comparing it to the correct answer of the question.
                    let ansString = "ABCD"          // reference array used to determine the correct index to answer
                    // choiceOffset will contain the converted index of the selected answer from the available choices
                    if let choiceOffset = ansString.firstIndex(of: Character(ans))?.utf16Offset(in: ansString) {
                        // Feed the player's answer to the game engine to check if it is correct
                        // (Note: There's no need to catch exception since the choice has already been vetted before use.)
                        gameStatus = try game.answerQuestion(answer: curQuestionChoices[choiceOffset]!)
                        
                        // Check if player answered the question correctly.
                        if gameStatus == GameStatus.GameLevelUp {
                            // Display message if answer is correct and continue looping to the next game level.
                            print("\n\t*** You chose the right answer! Proceeding to next level... ***")
                        }
                        // Check if we can offer user to walk away or continue with the game.
                        else if gameStatus == GameStatus.GameLevelUpWithWalkAway {
                            // Indicate that answer is correct and prompt if player wants to walk away from game
                            print("\n\t*** You chose the right answer! ***")
                            let walkawayResult = promptWalkAway(walkAwayCash: game.getPrizeMoney())
                            if walkawayResult == "W" {
                                // User chose to walk away, exit the game loop and display game results.
                                break;
                            }
                            else {
                                // Player has decided to continue playing.
                                print("\n\t*** Proceeding to next level... ***")
                            }
                        }
                    }
                }
            }
        }
    } while gameStatus != GameStatus.GameOverYouLost && gameStatus != GameStatus.GameOverYouWin
    
    // Game is now over, display results according to the gameStatus information.
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
            print("\t*** You chose the right answer! Final level completed... ***\n")
            print("*********************************************")
            print(" Congratulations! You are now a millionaire.")
            print(" You won $1,000,000!")
            print("*********************************************")
        default:
            print("Game exitted abnormally.")
        }
        print("\nGAME OVER!\n")
    }
}

//
//  prompts.swift
//  millionaire
//
//  Description: Contains all the user prompts available for the game.
//
//  Created by Louise Chan on 2020-03-20.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

// Common error message for invalid inputs.
let invalidInputMessage = "\n\t***Invalid input. Try again.***"

func promptCommonProcessor(message: String, inputChoices: [String]) -> String {
    repeat {
        // Print the prompt message
        print(message, terminator: "")
        // Ensure that input is not nil before processing it.
        guard let input = readLine() else {
            // Input is nil, specify invalid input message
            print(invalidInputMessage)
            continue
        }
        // Convert input to uppercase so that letter case will
        // be ignored during comparison
        let choice = input.uppercased()
        for ic in inputChoices {
            // Check if input matches any of the available choices
            if choice == ic {
                // Return the matching choice string
                return choice
            }
        }
        
        // Input does not match any of the choices, inform app
        // that the input is invalid
        print(invalidInputMessage)

    } while true        // Loop indefinitely
}

// Allows user to choose the difficulty level of the game.
func promptGameDifficulty() -> String {
    let promptMessage = "\nEnter game difficulty ('E' for easy, 'H' for hard): "
    return promptCommonProcessor(message: promptMessage, inputChoices: ["E", "H"])
}

// Prompts user to choose for the correct answer or to use a lifeline.
func promptAnswer() -> String {
    let promptMessage = "\nEnter [A, B, C or D] to select an answer or enter [L] to use a lifeline: "
    return promptCommonProcessor(message: promptMessage, inputChoices: ["A", "B", "C", "D", "L"])
}

// Prompts to user to confirm the answer to the current question being asked.
func promptFinalAnswer() -> String {
    let promptMessage = "\nIs that your final answer? (Enter 'Y' to confirm, 'N' to change answer): "
    return promptCommonProcessor(message: promptMessage, inputChoices: ["Y", "N"])
}

// Prompts the user whether to continue to the next level or walk away from the game with money.
func promptWalkAway(walkAwayCash: Int) -> String {
    let promptMessage = "\nDo you want to continue or walk away with $\(walkAwayCash) (Enter 'C' to continue or 'W' to walk away): "
    return promptCommonProcessor(message: promptMessage, inputChoices: ["W", "C"])
}

// Prompts user to select which available lifeline to use for the current question being asked.
func promptLifeLines(ll: [LifeLineTypes: LifeLine]) -> LifeLineTypes {
    repeat {
        print("\nAvailable lifeline(s): ", terminator: "\n\t")
        // Build lifeline menu based on available lifelines.
        var lifelineMenu: [Int: LifeLineTypes] = [:]
        var menuChoiceCnt = 1
        for (type, _) in ll {
            lifelineMenu[menuChoiceCnt] = type
            menuChoiceCnt += 1
        }
        
        // Show menu to user
        for i in 1...lifelineMenu.count {
            let lifelineStr = "<" + String(i) + "> " + (lifelineMenu[i]?.rawValue ?? "")
            print(lifelineStr.padding(toLength: 25, withPad: " ", startingAt: 0), terminator: "")
        }

        print("\nEnter number corresponding to the Lifeline that you want to use: ", terminator: "")
        if let choice = readLine() {
            if let numChoice = Int(choice) {
                if let llType = lifelineMenu[numChoice] {
                    return llType
                }
            }
        }
        
        print(invalidInputMessage)
        
    } while true
}



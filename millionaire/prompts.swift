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

// Allows user to choose the difficulty level of the game.
func promptGameDifficulty() -> String {
    repeat {
        print("\nEnter game difficulty ('E' for easy, 'H' for hard): ", terminator: "")
        guard let gameLevel = readLine() else {
            print(invalidInputMessage)
            continue
        }
        let choice = gameLevel.uppercased()
        if choice == "E" || choice == "H" {
            return choice
        }
        else {
            print(invalidInputMessage)
        }
    } while true
}

// Prompts user to choose for the correct answer or to use a lifeline.
func promptAnswer() -> String {
    repeat {
        print("\nEnter [A, B, C or D] to select an answer or enter [L] to use a lifeline: ", terminator: "")

        guard let gameLevel = readLine() else {
            print(invalidInputMessage)
            continue
        }
        let choice = gameLevel.uppercased()
        if choice == "A" || choice == "B" || choice == "C" || choice == "D" || choice == "L" {
            return choice
        }
        else {
            print(invalidInputMessage)
        }
    } while true
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

// Prompts to user to confirm the answer to the current question being asked.
func promptFinalAnswer() -> String {
    repeat {
        print("\nIs that your final answer? (Enter 'Y' to confirm, 'N' to change answer): ", terminator: "")
        
        guard let response = readLine() else {
            print(invalidInputMessage)
            continue
        }
        
        let choice = response.uppercased()
        if choice == "Y" || choice == "N" {
            return choice
        }
        else {
            print(invalidInputMessage)
        }
    } while true

}

// Prompts the user whether to continue to the next level or walk away from the game with money.
func promptWalkAway(walkAwayCash: Int) -> String {
    repeat {
        print("\nDo you want to continue or walk away with $\(walkAwayCash) (Enter 'C' to continue or 'W' to walk away): ", terminator: "")
        
        guard let response = readLine() else {
            print(invalidInputMessage)
            continue
        }
        let choice = response.uppercased()
        if choice == "W" || choice == "C" {
            return choice
        }
        else {
            print(invalidInputMessage)
        }
    } while true
}

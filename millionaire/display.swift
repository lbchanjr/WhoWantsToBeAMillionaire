//
//  display.swift
//  millionaire
//
//  Description: Contains the function used to display the question and possible answers
//               for the current game level.
//  Created by Louise Chan on 2020-03-20.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

func showData(question: Question, level: Int, prize: Int, lifelines: Int, diff: String) {
    // Show game information such current level, available lifelines and game difficulty selected.
    print("\n===============================================================================")
    let contents = " Level \(level) ($\(prize))"
    print(contents.padding(toLength: 30, withPad: " ", startingAt: 0), terminator: "")
    print("Lifelines: \(lifelines)".padding(toLength: 25, withPad: " ", startingAt: 0), terminator: "")
    print("\tDifficulty: " + diff)
    print("===============================================================================")
    
    // Show the current level's question
    print("\n" + question.getQuestion())
    
    // Show the possible answers to the question.
    let choiceLetters = ["<A> ", "<B> ", "<C> ", "<D> "]
    
    let choices = question.getChoicesWithExtraInfo()
    for i in 0..<choiceLetters.count {
        print("\t", terminator: "")
        
        // Display possible answer to the question with proper space character padding
        let q = choices[i].0 ?? ""
        print(choiceLetters[i] + q.padding(toLength: 30, withPad: " ", startingAt: 0), terminator: "")
        
        // Show additional info for the question if there's any (i.e. poll results)
        // with proper space char padding
        if let pollValue = choices[i].1 {
            let strPollData = "[" + pollValue + "]"
            print(strPollData.padding(toLength: 10, withPad: " ", startingAt: 0), terminator: "")
        }
        else {
            // Show nothing (aside from the answer choice if there's no extra information)
            print("".padding(toLength: 10, withPad: " ", startingAt: 0), terminator: "")
        }
        
        // Insert a carriage return before displaying choice C and D
        // (choices A and B will be displayed on the same line)
        if i % 2 == 1 {
            print("")
        }
    }
}

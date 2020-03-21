//
//  display.swift
//  millionaire
//
//  Created by Louise Chan on 2020-03-20.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

func showData(question: Question, level: Int, prize: Int, lifelines: Int, diff: String) {
    print("\n===============================================================================")
    let contents = " Level \(level) ($\(prize))"
    print(contents.padding(toLength: 30, withPad: " ", startingAt: 0), terminator: "")
    print("Lifelines: \(lifelines)".padding(toLength: 25, withPad: " ", startingAt: 0), terminator: "")
    print("\tDifficulty: " + diff)
    print("===============================================================================")
    
    print("\n" + question.getQuestion())
    
    let choiceLetters = ["<A> ", "<B> ", "<C> ", "<D> "]
    
    let choices = question.getChoicesWithExtraInfo()
    for i in 0..<choiceLetters.count {
        print("\t", terminator: "")
        let q = choices[i].0 ?? ""
        print(choiceLetters[i] + q.padding(toLength: 30, withPad: " ", startingAt: 0), terminator: "")
        if let pollValue = choices[i].1 {
            let strPollData = "[" + pollValue + "]"
            print(strPollData.padding(toLength: 10, withPad: " ", startingAt: 0), terminator: "")
        }
        else {
            print("".padding(toLength: 10, withPad: " ", startingAt: 0), terminator: "")
        }
        
        if i % 2 == 1 {
            print("")
        }
    }
}

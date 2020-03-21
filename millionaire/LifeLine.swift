//
//  LifeLine.swift
//  millionaire
//
//  Created by Louise Chan on 2020-03-18.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

class LifeLine {
    func processLifeLine(q: Question) -> Question {
        return q
    }
}

class LifeLine5050: LifeLine {
    
    override func processLifeLine(q: Question) -> Question {
        var question = q
        
        // Look for the index of the answer in the choices array
        // and also build an array containing indices of other choices
        // so that we can choose which one to retain after shuffling them.
        var indexArray = [Int]()
        for i in 0..<q.choices.count {
            if q.choices[i].0 != q.answer {
                indexArray.append(i)
            }
        }
        
        // Shuffle all incorrect answers
        indexArray.shuffle()
        
//        print("DEBUG: ", terminator:" ")
//        print(indexArray)
        
        // After this loop indexArray will contain the indices of the wrong answers
        // Shuffle these indices and select the first shuffled value as the index to retain.
        // This is done by setting the choice value of non-selected indices to nil.
        for i in 1..<indexArray.count {
            question.choices[indexArray[i]].0 = nil
        }
        
        // At this point, the copy of the input question's choices (i.e. "question") will only contain
        // the correct answer and one incorrect answer since other choices has been set to nil
        // Return this updated Question class to the app
        return question
    }
}

class LifeLineAudience: LifeLine {
    
    override func processLifeLine(q: Question) -> Question {
        var question = q                        // Make a copy of the question to modify
        let aiWillHelp = Bool.random()          // Simple way to allow the lifeline to decide whether
                                                // to help user by increasing the percentage of the correct answer
        var percentRemaining = 100.0            // Starting percentage to work on for the dummy polling
        
        // Check how many choices are to be polled
        var nonNilChoiceCnt = 0
        for c in q.choices {
            if c.0 != nil {
                nonNilChoiceCnt += 1
            }
        }
        
        for i in 0..<q.choices.count {
            if q.choices[i].0 == nil {
                continue
            }
            
            if i == q.choices.count-1 || nonNilChoiceCnt == 1 {
                question.choices[i].1 = String(format: "%.1f%%", percentRemaining)
                break
            }
            else if percentRemaining <= 0.09 {
                question.choices[i].1 = "0.0%"
            }
            else {
                var randPercent: Double
                if q.choices[i].0 == q.answer {
                    // Increase chances of generating a higher percentage if aiWillHelp is true
                    randPercent = (aiWillHelp ? Double.random(in: 50.1...percentRemaining): Double.random(in: 0...percentRemaining))
                }
                else {
                    // Decrease chances of generating a higher percentage if aiWillHelp is false
                    let upperBoundChkNonAns = (percentRemaining<50) ? percentRemaining : (percentRemaining-50)
                    randPercent = (aiWillHelp ? Double.random(in: 0...upperBoundChkNonAns): Double.random(in: 0...percentRemaining))
                }
                
                // Round off data to one decimal place
                randPercent = (randPercent * 10).rounded() / 10
                
                // If generated percentage is more than the remaining percentage, use the remaining percentage
                if randPercent > percentRemaining {
                    randPercent = percentRemaining
                }
                
                // Append polling percentage as extra info
                question.choices[i].1 = String(format: "%.1f%%", randPercent)
                percentRemaining -= randPercent
                nonNilChoiceCnt -= 1
            }
        }
        
        // Provide update question structure to the caller
        return question
    }
}

class LifeLinePhoneAFriend: LifeLine {
    
    override func processLifeLine(q: Question) -> Question {
        var question = q
        var randChoiceIndex: Int
        
        // Generate a random value between 0 to 3 to be able to select a
        // random index for the choices.
        // If choice has no value (i.e. nil) another random index will be generated
        repeat {
            randChoiceIndex = Int.random(in: 0...3)
        } while q.choices[randChoiceIndex].0 == nil
        
        // Get rid of other answers by setting the choice part of the tuple to nil
        for i in 0..<question.choices.count {
            if i != randChoiceIndex {
                question.choices[i].0 = nil
            }
        }
        
        // Return modified question, this will contain only one answer randomly chosen
        // by the "dummy" friend that was called.
        return question
    }
}

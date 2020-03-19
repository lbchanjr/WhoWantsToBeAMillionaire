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
        let randChoiceIndex = Int.random(in: 0...2)
        for i in 0..<q.wrongAnswers.count {
            if i != randChoiceIndex {
                question.wrongAnswers[i].0 = nil
            }
        }
        return question
    }
}

class LifeLineAudience: LifeLine {
    override func processLifeLine(q: Question) -> Question {
        var question = q
        let randChoiceIndex = Int.random(in: 0...2)
        for i in 0..<q.wrongAnswers.count {
            if i != randChoiceIndex {
                question.wrongAnswers[i].0 = nil
            }
        }
        return question
    }
}

class LifeLineCallFriend: LifeLine {
    override func processLifeLine(q: Question) -> Question {
        var question = q
        let randChoiceIndex = Int.random(in: 0...2)
        for i in 0..<q.wrongAnswers.count {
            if i != randChoiceIndex {
                question.wrongAnswers[i].0 = nil
            }
        }
        return question
    }
}

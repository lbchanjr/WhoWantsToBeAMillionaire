//
//  enums.swift
//  millionaire
//
//  Created by Louise Chan on 2020-03-20.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

/************************************************
 Game-specific enumerations
 ************************************************/

enum GameStatus {
    case GameStarted
    case GameOverYouLost
    case GameOverYouWin
    case GameLevelUp
    case GameLevelUpWithWalkAway
    case GameNoLevelChange
}

enum QuestionException: Error {
    case NotEnoughEasyQuestions
    case NotEnoughHardQuestions
    case NoQuestionsLoaded(String)
}

enum PrizeLevelException: Error {
    case CashPrizeLevelMismatch(String)
    case NoCashPrizesLoaded(String)
    case LevelIsOutOfRange
}

enum Difficulty {
    case EASY, HARD
}

/************************************************
 Lifeline-specific enumerations
 ************************************************/

enum LifeLineTypes: String {
    case PhoneAFriend = "Phone a friend"
    case FiftyFifty = "Fifty-fifty"
    case AudiencePoll = "Ask the audience"
}

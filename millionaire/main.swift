//
//  main.swift
//  millionaire
//
//  Created by Louise Chan on 2020-03-18.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

let q1 = Question(question: "7-Eleven stores were temporarily converted into Kwik E-marts to promote the release of what movie?", answer: "THE SIMPSONS MOVIE", otherChoices: ["BEAVIS AND BUTTHEAD DO AMERICA", "WHO FRAMED ROGER RABBIT?", "TOY STORY"])
let q2 = Question(question: "On an old-fashioned rotary phone,what number requires the longest turn of the dial?", answer: "0", otherChoices: ["1", "9", "5"])
let q3 = Question(question: "On an ’80s TV series, a plucky orphan named Penelope Brewster was better known as what?", answer: "PUNKY", otherChoices: ["DENISE", "LIZZIE", "HANNAH"])
let q4 = Question(question: "In the abbreviation for the medical procedure popularly known as an MRI,what does the “I’ stand for?", answer: "IMAGING", otherChoices: ["ITEM", "INCISION", "INJECTION"])
let q5 = Question(question: "On average, what denomination of U.S. paper currency remains in circulation the longest?", answer: "100 DOLLAR BILL", otherChoices: ["20 DOLLAR BILL", "50 DOLLAR BILL", "1 DOLLAR BILL"])
let q6 = Question(question: "A 1960s TV character played by Al Lewis, Count Vladimir Dracula is better known by what name?", answer: "GRANDPA MUNSTER", otherChoices: ["UNCLE FRANKIE", "VLAD", "NOSFERATU"])
let q7 = Question(question: "A 1985 North Atlantic expedition led by Robert Ballard discovered the wreck of what famous ship 73 years after it sank?", answer: "TITANIC", otherChoices: ["LUSITANIA", "BRITANNIC", "CARPATHIA"])
let q8 = Question(question: "On average,a healthy person’s resting heart rate falls into which of these ranges of beats-per-minute?", answer: "60-100", otherChoices: ["80-120", "40-80", "100-130"])
let q9 = Question(question: "A 2010 study found that nearly 70% of what imported item failed to live up to its claims of being “extra virgin”?", answer: "OLIVE OIL", otherChoices: ["CORN STARCH", "LYCHEES", "YOGHURT"])
let q10 = Question(question: "In the children’s rhyme “This Little Piggy,” where did the first little piggy go?", answer: "TO MARKET", otherChoices: ["TO SCHOOL", "TO LIBRARY", "TO CHURCH"])

let q11 = Question(question: "Which of the music on the epic 1982 album “Thriller” was recorded by members of what 80s group?", answer: "TOTO", otherChoices: ["THE BREAD", "RED HOT CHILLI PEPPERS", "SCORPIONS"])
let q12 = Question(question: "Which of these great painters is commonly known by the name of his home town, not by his birth name?", answer: "CARAVAGGIO", otherChoices: ["MICHAELANGELO", "LEONARDO DA VINCI", "REMBRANDT"])
let q13 = Question(question: "Ron Wayne, who would be a billionaire today had he not sold his 10% stake for $800 back in 1976, co-founded what company?", answer: "APPLE", otherChoices: ["MICROSOFT", "ORACLE", "AMAZON"])
let q14 = Question(question: "Dim sum, a meal of varied dishes originating in Chinese, translates loosely into English as “a little bit of” what?", answer: "HEART", otherChoices: ["FOOD", "SNACK", "LOVE"])
let q15 = Question(question: "When England adopted the new Gregorian calendar in 1752,people complained that they “lost” how many days?", answer: "11", otherChoices: ["29", "10", "31"])
let q16 = Question(question: "The “Pua alohalo” is Hawaii’s official state what?", answer: "FLOWER", otherChoices: ["BIRD", "FRUIT", "ANIMAL"])
let q17 = Question(question: "What song’s famous melody was written in 1893 by sisters Patty and Mildred Hill?", answer: "HAPPY BIRTHDAY TO YOU", otherChoices: ["STAR SPANGLED BANNER", "JINGLE BELLS", "AMAZING GRACE"])
let q18 = Question(question: "Which of these countries’ people usually eat with fork and spoon, only using chopsticks for noodles?", answer: "THAILAND", otherChoices: ["CHINA", "VIETNAM", "SOUTH KOREA"])
let q19 = Question(question: "What extremely tall author once used the pen name John Lange, a German surnamed meaning 'long'?", answer: "MICHAEL CRICHTON", otherChoices: ["STEPHEN KING", "WILLIAM SHAKESPEAR", "ROBERT LUDLUM"])
let q20 = Question(question: "A phillumenist is a collector of what?", answer: "MATCHBOOKS", otherChoices: ["STAMPS", "FLAGS", "BOOKS"])

let easyQ = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10]
let hardQ = [q11, q12, q13, q14, q15, q16, q17, q18, q19, q20]

let easyPrizes = [100, 500, 1000, 8000, 16000, 32000, 125000, 500000, 1000000]
let hardPrizes = [100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]

let game = Millionaire(difficulty: Difficulty.EASY)
try game.loadCashPrizes(levelPrizes: easyPrizes)
try game.loadQuestions(easyQuestions: easyQ, hardQuestions: hardQ)

var gameStatus: GameStatus?

//repeat {
    let curQuestion = game.getCurrentQuestion()
    print(curQuestion.getQuestion())
    for s in curQuestion.getChoices() {
        print("Answer: " + (s ?? ""))
    }
//} while gameStatus != GameStatus.GameOverYouLost && gameStatus != GameStatus.GameOverYouWin

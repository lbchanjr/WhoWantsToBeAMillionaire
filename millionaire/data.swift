//
//  data.swift
//  millionaire
//
//  Description: Contains all the questions, answers and prize money used in the game.
//               Questions and prizes are available according to the game difficulty set in the game.
//
//  Created by Louise Chan on 2020-03-20.
//  Copyright © 2020 Louise Chan. All rights reserved.
//

import Foundation

// Prize money for all levels in EASY mode of the game.
let easyPrizeMoneyArray = [100, 500, 1000, 8000, 16000, 32000, 125000, 500000, 1000000]
// Prize money for all levels in HARD mode of the game.
let hardPrizeMoneyArray = [100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]

// Questions that are considered easy to answer.
let easyQuestionsArray = [Question(question: "7-Eleven stores were temporarily converted into Kwik E-marts to promote the release of what movie?", answer: "THE SIMPSONS MOVIE", otherChoices: ["BEAVIS AND BUTTHEAD DO AMERICA", "WHO FRAMED ROGER RABBIT?", "TOY STORY"]),
                          Question(question: "On an old-fashioned rotary phone,what number requires the longest turn of the dial?", answer: "0", otherChoices: ["1", "9", "5"]),
                          Question(question: "On an ’80s TV series, a plucky orphan named Penelope Brewster was better known as what?", answer: "PUNKY", otherChoices: ["DENISE", "LIZZIE", "HANNAH"]),
                          Question(question: "In the abbreviation for the medical procedure popularly known as an MRI,what does the “I’ stand for?", answer: "IMAGING", otherChoices: ["ITEM", "INCISION", "INJECTION"]),
                          Question(question: "On average, what denomination of U.S. paper currency remains in circulation the longest?", answer: "100 DOLLAR BILL", otherChoices: ["20 DOLLAR BILL", "50 DOLLAR BILL", "1 DOLLAR BILL"]),
                          Question(question: "A 1960s TV character played by Al Lewis, Count Vladimir Dracula is better known by what name?", answer: "GRANDPA MUNSTER", otherChoices: ["UNCLE FRANKIE", "VLAD", "NOSFERATU"]),
                          Question(question: "A 1985 North Atlantic expedition led by Robert Ballard discovered the wreck of what famous ship 73 years after it sank?", answer: "TITANIC", otherChoices: ["LUSITANIA", "BRITANNIC", "CARPATHIA"]),
                          Question(question: "On average, a healthy person’s resting heart rate falls into which of these ranges of beats-per-minute?", answer: "60-100", otherChoices: ["80-120", "40-80", "100-130"]),
                          Question(question: "A 2010 study found that nearly 70% of what imported item failed to live up to its claims of being “extra virgin”?", answer: "OLIVE OIL", otherChoices: ["CORN STARCH", "LYCHEES", "YOGHURT"]),
                          Question(question: "In the children’s rhyme “This Little Piggy,” where did the first little piggy go?", answer: "TO MARKET", otherChoices: ["TO SCHOOL", "TO LIBRARY", "TO CHURCH"])]

// Questions that are considered difficult to answer.
let difficultQuestionsArray = [Question(question: "Which of the music on the epic 1982 album “Thriller” was recorded by members of what 80s group?", answer: "TOTO", otherChoices: ["THE BREAD", "RED HOT CHILLI PEPPERS", "SCORPIONS"]),
                          Question(question: "Which of these great painters is commonly known by the name of his home town, not by his birth name?", answer: "CARAVAGGIO", otherChoices: ["MICHAELANGELO", "LEONARDO DA VINCI", "REMBRANDT"]),
                          Question(question: "Ron Wayne, who would be a billionaire today had he not sold his 10% stake for $800 back in 1976, co-founded what company?", answer: "APPLE", otherChoices: ["MICROSOFT", "ORACLE", "AMAZON"]),
                          Question(question: "Dim sum, a meal of varied dishes originating in Chinese, translates loosely into English as “a little bit of” what?", answer: "HEART", otherChoices: ["FOOD", "SNACK", "LOVE"]),
                          Question(question: "When England adopted the new Gregorian calendar in 1752, people complained that they “lost” how many days?", answer: "11", otherChoices: ["29", "10", "31"]),
                          Question(question: "The “Pua alohalo” is Hawaii’s official state what?", answer: "FLOWER", otherChoices: ["BIRD", "FRUIT", "ANIMAL"]),
                          Question(question: "What song’s famous melody was written in 1893 by sisters Patty and Mildred Hill?", answer: "HAPPY BIRTHDAY TO YOU", otherChoices: ["STAR SPANGLED BANNER", "JINGLE BELLS", "AMAZING GRACE"]),
                          Question(question: "Which of these countries’ people usually eat with fork and spoon, only using chopsticks for noodles?", answer: "THAILAND", otherChoices: ["CHINA", "VIETNAM", "SOUTH KOREA"]),
                          Question(question: "What extremely tall author once used the pen name John Lange, a German surnamed meaning 'long'?", answer: "MICHAEL CRICHTON", otherChoices: ["STEPHEN KING", "WILLIAM SHAKESPEAR", "ROBERT LUDLUM"]),
                          Question(question: "A phillumenist is a collector of what?", answer: "MATCHBOOKS", otherChoices: ["STAMPS", "FLAGS", "BOOKS"])]

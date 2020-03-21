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
                          Question(question: "In the children’s rhyme “This Little Piggy,” where did the first little piggy go?", answer: "TO MARKET", otherChoices: ["TO SCHOOL", "TO LIBRARY", "TO CHURCH"]),
                          Question(question: "A blacksmith works primarily with what metal?", answer: "IRON", otherChoices: ["COPPER", "SILVER", "ALUMINUM"]),
                          Question(question: "A Boston native,what late night host’s sister made her film debut as one of the Eklund sisters in “The Fighter”?", answer: "CONAN O'BRIEN", otherChoices: ["JAY LENO", "DAVID LETTERMAN", "JIMMY KIMMEL"]),
                          Question(question: "A caprese salad traditionally includes which of these ingredients?", answer: "MOZZARELLA CHEESE", otherChoices: ["OLIVES", "TOMATOES", "JALAPENOS"]),
                          Question(question: "On the human body, the area of skin known as “The T-zone” is located where?", answer: "FACE", otherChoices: ["TORSO", "ARMS", "LEGS"]),
                          Question(question: "On the children’s TV “Dora the Explorer,” Dora’s best friend Boots is what kind of animal?", answer: "MONKEY", otherChoices: ["DOG", "FOX", "PARROT"]),
                          Question(question: "On television, Dr. Gregory House’s apartment number is “221B,” a nod to what famous literary sleuth’s address?", answer: "SHERLOCK HOLMES", otherChoices: ["HERCULE POIROT", "NANCY DREW", "PERRY MASON"]),
                          Question(question: "On Home Depot’s web site, “islands” are items marked for what room of the house?", answer: "KITCHEN", otherChoices: ["LIVING ROOM", "BATHROOM", "BEDROOM"]),
                          Question(question: "On the Internet, the abbreviation “LOL” typically denotes which of these emotional states?", answer: "AMUSEMENT", otherChoices: ["SADNESS", "SURPRISE", "ANGER"]),
                          Question(question: "On the Simpsons, what member of the Simpson family is commonly seen sucking on a pacifier?", answer: "MAGGIE", otherChoices: ["LISA", "BART", "HOMER"]),
                          Question(question: "One of the coaches on the talent show “The Voice,” Adam Levine is best known as the frontman for what rock band?", answer: "MAROON 5", otherChoices: ["GREEN DAY", "FOO FIGHTERS", "COLDPLAY"]),
                          Question(question: "A classic 1984 Super Bowl commercial titled “1984” introduced what product to the public?", answer: "MACINTOSH COMPUTER", otherChoices: ["PEPSI", "SEGWAY", "GM HUMMER"]),
                          Question(question: "A collection of Sanskrit hymns and verses known as the Vedas are sacred texts in what religion?", answer: "HINDUISM", otherChoices: ["BUDDHISM", "ISLAM", "SHINTO"]),
                          Question(question: "In the Disney animated classic “Pinocchio,” what kind of animal swallows Pinocchio whole?", answer: "WHALE", otherChoices: ["GIANT TOAD", "WALRUS", "CROCODILE"]),
                          Question(question: "In the e-mail and memo abbreviation “bcc,” what does the “b” stand for?", answer: "BLIND", otherChoices: ["BACKUP", "BEST", "BRIGHT"]),
                          Question(question: "In the film “Forrest Gump,” Forrest tells President Kennedy “I gotta pee” after drinking 15 bottles of what?", answer: "DR. PEPPER", otherChoices: ["COKE", "GATORADE", "KOOL-AID"])]

// Questions that are considered difficult to answer.
let difficultQuestionsArray = [Question(question: "Which of the music on the epic 1982 album “Thriller” was recorded by members of what 80s group?", answer: "TOTO", otherChoices: ["THE BREAD", "RED HOT CHILLI PEPPERS", "SCORPIONS"]),
                          Question(question: "Which of these great painters is commonly known by the name of his home town, not by his birth name?", answer: "CARAVAGGIO", otherChoices: ["MICHAELANGELO", "LEONARDO DA VINCI", "REMBRANDT"]),
                          Question(question: "Ron Wayne, who would be a billionaire today had he not sold his 10% stake for $800 back in 1976, co-founded what company?", answer: "APPLE", otherChoices: ["MICROSOFT", "ORACLE", "AMAZON"]),
                          Question(question: "Dim sum, a meal of varied dishes originating in Chinese, translates loosely into English as “a little bit of” what?", answer: "HEART", otherChoices: ["FOOD", "SNACK", "LOVE"]),
                          Question(question: "When England adopted the new Gregorian calendar in 1752, people complained that they “lost” how many days?", answer: "11", otherChoices: ["29", "10", "31"]),
                          Question(question: "The “Pua alohalo” is Hawaii’s official state what?", answer: "FLOWER", otherChoices: ["BIRD", "FRUIT", "ANIMAL"]),
                          Question(question: "What song’s famous melody was written in 1893 by sisters Patty and Mildred Hill?", answer: "HAPPY BIRTHDAY TO YOU", otherChoices: ["STAR SPANGLED BANNER", "JINGLE BELLS", "AMAZING GRACE"]),
                          Question(question: "Which of these countries’ people usually eat with fork and spoon, only using chopsticks for noodles?", answer: "THAILAND", otherChoices: ["CHINA", "VIETNAM", "SOUTH KOREA"]),
                          Question(question: "What extremely tall author once used the pen name John Lange, a German surnamed meaning 'long'?", answer: "MICHAEL CRICHTON", otherChoices: ["STEPHEN KING", "WILLIAM SHAKESPEARE", "ROBERT LUDLUM"]),
                          Question(question: "A phillumenist is a collector of what?", answer: "MATCHBOOKS", otherChoices: ["STAMPS", "FLAGS", "BOOKS"]),
                          Question(question: "In 1968, what overzealous airline began taking reservations for lunar flights that were set to take off in 2000?", answer: "PAN AM", otherChoices: ["AMERICAN AIRLINES", "VIRGIN ATLANTIC", "DELTA AIRLINES"]),
                          Question(question: "What legendary entertainer was buried with $1,008 so he’d always have enough money to play cards?", answer: "GEORGE BURNS", otherChoices: ["RODNEY DANGERFIELD", "FRANK SINATRA", "ELVIS PRESLEY"]),
                          Question(question: "Murdered in 1985,zoologist Dian Fossey was buried with more than a dozen of her gorillas in what country?", answer: "RWANDA", otherChoices: ["CONGO", "TANZANIA", "MOZAMBIQUE"]), Question(question: "In Egyptian mythology, a criosphinx is a figure that has the body of a lion and the head of a what?", answer: "RAM", otherChoices: ["DOG", "CAT", "EAGLE"]),
                          Question(question: "Born with the less cool-sounding name Walter, which of these actors prefers to go by his middle name?", answer: "BRUCE WILLIS", otherChoices: ["MEL GIBSON", "TOM HANKS", "DENZEL WASHINGTON"]),
                          Question(question: "Aristotle wrote that what animal, though immune from other illnesses, is occasionally subject to “flatulency”?", answer: "ELEPHANT", otherChoices: ["GORILLA", "DOG", "TIGER"]),
                          Question(question: "A 2010 study by IBM on “commuter pain” revealed which of these cities has the most painful commute?", answer: "BEIJING", otherChoices: ["PARIS", "NEW YORK", "SYDNEY"]),
                          Question(question: "Poison ivy belongs to a diverse botanical family that also includes the cashew and what tropical fruit?", answer: "MANGO", otherChoices: ["PINEAPPLE", "PAPAYA", "BANANA"]),
                          Question(question: "Which of these ancient Greek philosophers first wrote about the lost civilization of Atlantis?", answer: "PLATO", otherChoices: ["ARISTOTLE", "PYTHAGORAS", "SOCRATES"]),
                          Question(question: "What famously quotable female head of state once told her foreign minister, “Don’t be so humble–you’re not that great”?", answer: "GOLDA MEIR", otherChoices: ["HILLARY CLINTON", "MARGARET THATCHER", "ANGELA MERKEL"]),
                          Question(question: "On Sesame Street, the feathers on the big bird costume, excluding the tail, are from what bird?", answer: "TURKEY", otherChoices: ["CHICKEN", "OSTRICH", "GOOSE"]),
                          Question(question: "According to Crayola, which of these products will help remove crayon stains from washable clothing?", answer: "WD-40", otherChoices: ["DOWNEY", "LYSOL", "COCA-COLA"]),
                          Question(question: "By definition, an ecdysiast has what unusual job?", answer: "EXOTIC DANCER", otherChoices: ["WRITER", "GARDENER", "BODYGUARD"]),
                          Question(question: "What country’s capital city has a name that means “capital” in its native tongue?", answer: "SOUTH KOREA", otherChoices: ["GREAT BRITAIN", "AFGHANISTAN", "THAILAND"]),
                          Question(question: "What video game character lent its name to a human gene that affects finger and toe placement?", answer: "SONIC THE HEDGEHOG", otherChoices: ["DONKEY KONG", "SUPER MARIO", "PAC-MAN"]),
                          Question(question: "What automaker’s name is a word that means “modern” in its home country?", answer: "HYUNDAI", otherChoices: ["AUDI", "FIAT", "TOYOTA"])]

//
//  QuizManager.swift
//  LeggoQuiz
//
//  Created by hhhh on 24/11/2023.
//

import Foundation
import SwiftUI

class QuizManager: ObservableObject{
    private var mascotQ: [MascotQuiz] = []
    private var eventQ: [EventQuiz] = []
    @Published private(set) var mascotIndex = 0
    @Published private(set) var mascotQIndex = 0
    @Published private(set) var eventQIndex = 0
    
    // Variables to display a quiz
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var explanation: AttributedString = ""
    @Published private(set) var hasExplanation: Bool = false
    
    // Variables to determine mascotQ or eventQ
    @Published private(set) var isEventQ = false
    
    // Variables to know if an answer has been selected and reached the end of trivia
    @Published private(set) var answerSelected = false
    @Published private(set) var reachedEnd = false
    
    // Variable to display explanation
    var isExplanationdisplayed = false
    
    // Variables for score and progress
    var maxScore = 8
    @Published private(set) var score = 0
    
    func decodeJsonFromJsonFile<T: Decodable>(jsonFileName: String, elementType: T.Type) -> [T] {
        if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
            if let data = try? Data(contentsOf: file) {
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([T].self, from: data)
                    return decoded
                } catch let error {
                    fatalError("Failed to decode JSON: \(error)")
                }
            }
            else {
                fatalError("First error")
            }
        } else {
            fatalError("Couldn't load \(jsonFileName) file")
        }
        return [] as [T]
    }
    
    init() {
        self.mascotQ = decodeJsonFromJsonFile(jsonFileName: "mascotQVie.json", elementType: MascotQuiz.self)
        self.eventQ = decodeJsonFromJsonFile(jsonFileName: "eventQEng.json", elementType: EventQuiz.self)
    }
    
    func next(){
        self.reachedEnd = false
        self.isEventQ = false
    }
    
    func updateMascot(mascot: Int){
        self.mascotIndex = mascot
        self.eventQIndex = mascot
        switch mascot{
        case 0:
//            mascotQIndex = Int.random(in: 0...2)       
            mascotQIndex = 0
        case 1:
            mascotQIndex = Int.random(in: 3...5)
            
        case 2:
            mascotQIndex = Int.random(in: 6...7)
        case 3:
            mascotQIndex = 8
        default:
            mascotQIndex = 0
        }
        
        self.isEventQ = false;
        self.reachedEnd = false
        setQuestion()
    }
    
    
    //     Function to set a new question and answer choices, and update the progress
    func setQuestion() {
        answerSelected = false
        //        progress = CGFloat(Double((index + 1)) / Double(length) * 350)
        
        if !isEventQ{
            let currentQuiz = mascotQ[mascotQIndex]
            question = currentQuiz.formattedQuestion
            answerChoices = currentQuiz.formattedChoices
            explanation = currentQuiz.formattedExplanation
            hasExplanation = currentQuiz.hasExplanation
            isExplanationdisplayed = false
        }
        else{
            let currentQuiz = eventQ[eventQIndex]
            question = currentQuiz.formattedQuestion
            answerChoices = currentQuiz.formattedChoices
            hasExplanation = false
            isExplanationdisplayed = false
            explanation = ""
        }
    }
    
    
    // Function to go to next question. If reached end of the trivia, set reachedEnd to true
    func goToNextQuestion() {
        // If didn't reach end of array, increment index and set next question
        if !isEventQ {
            isEventQ = true
            setQuestion()
        } else {
            // If reached end of array, set reachedEnd to true
            reachedEnd = true
        }
    }
    
    // Function to know that user selected an answer, and update the score
    func selectAnswer(answer: Answer) {
        answerSelected = true
        
        // If answer is correct, increment score
        if answer.isCorrect {
            score += 1
        }
    }
    
}

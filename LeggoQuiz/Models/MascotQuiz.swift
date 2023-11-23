//
//  Trivia.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import Foundation

struct MascotQuiz: Identifiable, Decodable{
    var id: Int
    var question: String
    var choices: [String]
    var correctAnswer: Int
    var explanation: String
    
    var formattedQuestion: AttributedString{
        do{
            return try AttributedString(markdown: question)
        } catch{
            print("Error setting formattedQuestion: \(error)")
            return ""
        }
    }
    
    var formattedExplanation: AttributedString{
        do{
            return try AttributedString(markdown: explanation)
        } catch{
            print("Error setting formattedQuestion: \(error)")
            return ""
        }
    }
    
    var formattedChoices: [Answer]{
        do {
            // Formatting all answer strings into AttributedStrings and creating an instance of Answer for each
            let answers: [Answer] = try choices.enumerated().map { index, answer in
                let isCorrect = index == correctAnswer // Replace correctAnswerIndex with the index of the correct answer
                return Answer(text: try AttributedString(markdown: answer), isCorrect: isCorrect)
            }
            return answers
            
        } catch {
            // If we run into an error, return an empty array
            print("Error setting answers: \(error)")
            return []
        }
    }
}

struct Trivia: Decodable{
    var results: [Result]
    
    struct Result: Decodable, Identifiable{
        var id: UUID{
            UUID()
        }
        var category: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString{
            do{
                return try AttributedString(markdown: question)
            } catch{
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var answers: [Answer] {
            do {
                // Formatting all answer strings into AttributedStrings and creating an instance of Answer for each
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrects = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                
                // Merging the correct and incorrect arrays together
                let allAnswers = correct + incorrects
                
                // Shuffling the answers so the correct answer isn't always the first answer of the array
                return allAnswers.shuffled()
            } catch {
                // If we run into an error, return an empty array
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
}

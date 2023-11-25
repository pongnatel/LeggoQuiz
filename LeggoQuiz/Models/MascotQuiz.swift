//
//  MascotQuiz.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import Foundation
import SwiftUI

struct MascotQuiz: Identifiable, Decodable{
    var id: Int
    var category: String
    var question: String
    var choices: [String]
    var correctAnswer: Int
    var hasExplanation: Bool
    var explanation: String
    
    var formattedQuestion: AttributedString{
        do{
            var text = try AttributedString(markdown: question)
            
            if let range = text.range(of: "comprehensive solution") {
                text[range].backgroundColor = Color.yellow
            }
            return text
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

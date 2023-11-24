//
//  Answer.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}

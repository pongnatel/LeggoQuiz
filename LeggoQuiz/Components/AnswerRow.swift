//
//  AnswerRow.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var quizManager: QuizManager
    var answer: Answer
    @State private var isSelected = false
    @State private var isHovered = false

    var green = Color(.green)
    var red = Color(.red)
    var gray = Color("dgray")

    var body: some View {
        HStack(spacing: 20) {
            Text(answer.text)
                .Choice()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .background(
            quizManager.answerSelected
                ? (answer.isCorrect ? green : (isSelected ? red : gray))
                : (isHovered ? Color("AccentColor").opacity(0.5) : gray)
        )
        .cornerRadius(10)
        .shadow(color: .black, radius: 0.5, y: 5)
        .onTapGesture {
            if !quizManager.answerSelected {
                isSelected = true
                quizManager.selectAnswer(answer: answer)
            }
        }
        .onHover { hovering in
            withAnimation {
                isHovered = hovering
            }
        }
    }
}

#Preview {
    AnswerRow(answer: Answer(text: "Single", isCorrect: false))
        .environmentObject(QuizManager())
}

//
//  QuestionView.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizManager : QuizManager
    @State private var isNextButtonDisabled = true
    @State private var isExplanationdisplayed = false
    
    var accentColor: Color {
        
        switch quizManager.mascotIndex{
        case 1:
            return Color("eco")
        case 2:
            return Color("emo")
        case 3:
            return Color("hacco")
        default:
            return Color("techno")
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 30) {
                    
                    VStack(alignment: .center, spacing: 20) {
                        
                        Text(quizManager.question)
                            .Title()
                            .lineLimit(nil)
                            .padding(.horizontal, 30)
                        
                        ForEach(quizManager.answerChoices, id: \.id) { answer in
                            if isExplanationdisplayed{
                                if answer.isCorrect{
                                    AnswerRow(answer: answer).environmentObject(quizManager)
                                }
                            }
                            else{
                                AnswerRow(answer: answer).environmentObject(quizManager)
                            }
                        }
                    }
                    
                    if !isNextButtonDisabled{
                        Button {
                            isNextButtonDisabled = true
                            quizManager.goToNextQuestion()
//                            isExplanationdisplayed = false
                        } label: {
                            PrimaryButton(text: "Next", background: quizManager.answerSelected ? accentColor : .gray)
                        }
                        
                    }

                }
                .padding(.horizontal)
                .frame(width: geometry.size.width * 0.7, height: geometry.size.width * 0.6)
                .frame(minWidth: geometry.size.width * 0.7, minHeight: geometry.size.width * 0.6)
                .background(.white)
                .cornerRadius(20) // Add rounded corners to the ZStack
                .navigationBarBackButtonHidden(true)
                .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
            }
        }
        .onChange(of: quizManager.answerSelected) {
            if quizManager.answerSelected{
                waitAndShowText()
            }
            
        }
    }
    
    func waitAndShowText() {

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // After a second, set shouldShowRow property for AnswerRow views based on your logic
//            for index in quizManager.answerChoices.indices {
//                quizManager.answerChoices[index].shouldShowRow = // Your condition here
//            }
            print("Hello")
            // Re-enable the button
            isNextButtonDisabled = false
            if quizManager.hasExplanation{
                isExplanationdisplayed = true
            }
        }
    }
        
}

#Preview {
    //    QuestionView()
    //        .environmentObject(QuizManager())
    TriviaView()
        .environmentObject(QuizManager())
}

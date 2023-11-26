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
    @Environment(\.presentationMode) var presentationMode
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
                            .Question()
                            .lineLimit(nil)
                            .padding(.horizontal, 30)
                        
                        ForEach(quizManager.answerChoices, id: \.id) { answer in
                            if quizManager.isExplanationdisplayed{
                                if answer.isCorrect{
                                    AnswerRow(answer: answer).environmentObject(quizManager)
                                }
                            }
                            else{
                                AnswerRow(answer: answer).environmentObject(quizManager)
                            }
                        }
                        
                        if quizManager.isExplanationdisplayed{
                            Explanation(text: quizManager.explanation, mascot: quizManager.mascotIndex)
                        }
                    }
                    
                    if !isNextButtonDisabled{
                        Button {
                            isNextButtonDisabled = true
                            quizManager.goToNextQuestion()
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
        .onChange(of: quizManager.answerSelected) { newAnswerSelected in
            if newAnswerSelected {
                waitAndShowText()
            }
        }
    }
    
    func waitAndShowText() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            print("Hello")
            // Re-enable the button
            isNextButtonDisabled = false
            if quizManager.hasExplanation{
                quizManager.isExplanationdisplayed = true
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

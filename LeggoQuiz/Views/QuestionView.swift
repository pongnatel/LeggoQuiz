//
//  QuestionView.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizManager : QuizManager
    
    var body: some View {
        VStack(spacing: 40){
            HStack(spacing: 40){
                Text("Triviva Game")
                    .lilacTitle()
            }
            
            //            ProgressBar(progress: triviaManager.progress)
            
            VStack(alignment: .leading, spacing: 40){
                Text(quizManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                
                ForEach(quizManager.answerChoices, id: \.id) {answer in
                    AnswerRow(answer: answer).environmentObject(quizManager)
                }
            }
            
            Button{
                quizManager.goToNextQuestion()
            } label:{
                PrimaryButton(text: "Next", background: quizManager.answerSelected ? Color("AccentColor") : .gray)
            }
            .disabled(!quizManager.answerSelected)
            
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color(.white))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    QuestionView()
        .environmentObject(QuizManager())
}

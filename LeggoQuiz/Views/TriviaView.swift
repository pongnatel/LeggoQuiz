//
//  TriviaView.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var quizManager : QuizManager
    @State private var navigateToQuestionView = false
    
    var body: some View {
        NavigationView {
            if quizManager.reachedEnd {
                VStack(spacing: 20) {
                    Text("Trivia Game")
                        .LargeTitle()
                    
                    Text("Congratulations")
                        .Title()
                    
                    
                    Text("You scored \(quizManager.score) out of \(quizManager.maxScore)")
                        .Question()
                    
                    
                    
                    Button {
                        quizManager.next()
                    } label: {
                        PrimaryButton(text: "Next")
                    }
                    
                    
                }
                .foregroundColor(Color("AccentColor"))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            } else {
                
                VStack (spacing: 0){
                    NavigationLink(destination: QuestionView().environmentObject(quizManager), isActive: $navigateToQuestionView) {
                        EmptyView()
                    }
                    HStack(spacing: 0){
                        Button {
                            quizManager.updateMascot(mascot: 0)
                            navigateToQuestionView = true
                        } label: {
                            MascotLevel(mascot: "techno")
                        }
                        .if(quizManager.currentMascot != 0) {
                            $0.overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0.2)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .edgesIgnoringSafeArea(.all)
                            )
                        }
                        Button {
                            quizManager.updateMascot(mascot: 1)
                            navigateToQuestionView = true
                        } label: {
                            MascotLevel(mascot: "eco")
                        }
                        .if(quizManager.currentMascot != 1) {
                            $0.overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0.2)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .edgesIgnoringSafeArea(.all)
                            )
                        }
                    }
                    .background(.red)
                    HStack(spacing: 0){
                        Button {
                            quizManager.updateMascot(mascot: 2)
                            navigateToQuestionView = true
                        } label: {
                            MascotLevel(mascot: "emo")
                        }
                        .if(quizManager.currentMascot != 2) {
                            $0.overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0.2)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .edgesIgnoringSafeArea(.all)
                            )
                        }
                        
                        Button {
                            quizManager.updateMascot(mascot: 3)
                            navigateToQuestionView = true
                        } label: {
                            MascotLevel(mascot: "hacco")
                        }
                        .if(quizManager.currentMascot != 3) {
                            $0.overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0.2)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .edgesIgnoringSafeArea(.all)
                            )
                        }
                    }
                    
                }
                .background(.blue)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
//        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    TriviaView()
        .environmentObject(QuizManager())
}

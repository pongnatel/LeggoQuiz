//
//  TriviaView.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var quizManager : QuizManager
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToQuestionView = false
    
    var language: String {
        // set language
        return quizManager.lang ? "vie" : "eng"
    }
    var body: some View {
        NavigationView {
            if quizManager.reachedEnd {
//                if // done 4 cau
//                    // then show finish -> return main menu button
                VStack(spacing: 20) {
                    Text(language == "vie" ? "VƯỢT CHƯỚNG NGẠI VẬT" : "ECO RACE")
                        .LargeTitle()
                    
                    Text(language == "vie" ? "Chúc mừng" : "Congratulation")
                        .Title()
                    
                    if language == "vie"{
                        Text("Bạn đạt được \(quizManager.score) trên \(quizManager.maxScore)")
                            .Question()
                    }
                    else{
                        Text("You scored \(quizManager.score) out of \(quizManager.maxScore)")
                            .Question()
                    }
                    
                    if quizManager.mascotIndex == 3{
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            PrimaryButton(text: language == "vie" ? "Chơi lại?" : "Reset game?", background: Color("red"))
                        }
                        .padding()
                    }
                    else{
                        Button {
                            quizManager.next()
                        } label: {
                            PrimaryButton(text: language == "vie" ? "Tiếp tục" : "Continue")
                        }
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

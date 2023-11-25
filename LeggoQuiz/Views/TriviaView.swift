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
                        .font(.custom("Rocgrotesk-regular", size: 30))
                        
                    
                    Text("You scored \(quizManager.score) out of 2")
                        
                    
                    //                 Uncomment the button and provide the appropriate action
//                    NavigationLink{
//                        TriviaView()
//                            .environmentObject(<#T##object: ObservableObject##ObservableObject#>)
//                    } label: {
//                        PrimaryButton(text: "Continue")
//                    }
                    
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
                        Button {
                            quizManager.updateMascot(mascot: 1)
                            navigateToQuestionView = true
                        } label: {
                            MascotLevel(mascot: "eco")
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
                        Button {
                            quizManager.updateMascot(mascot: 3)
                            navigateToQuestionView = true
                        } label: {
                            MascotLevel(mascot: "hacco")
                        }
                    }
                }
                .background(.blue)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    TriviaView()
        .environmentObject(QuizManager())
}

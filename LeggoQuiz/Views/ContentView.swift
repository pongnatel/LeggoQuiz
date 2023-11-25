//
//  ContentView.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var quizManager = QuizManager()
    var body: some View {
        NavigationView{
            VStack(spacing: 40) {
                VStack(spacing: 20){
                    Text("Vuot Chuong Ngai Vat")
                        .LargeTitle()
                    
                    Text("Are you ready?")
                        .Title()
                        
                    
                    NavigationLink{
                        TriviaView()
                            .environmentObject(quizManager)
                    } label: {
                        PrimaryButton(text: "Next")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(.white)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

#Preview {
    ContentView()
}

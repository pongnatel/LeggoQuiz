//
//  ContentView.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var quizManager = QuizManager()
    @State var langIcon = "vie"
    var body: some View {
        NavigationView{
            VStack(spacing: 40) {
                HStack{
                    Spacer()
                    
                    Button(action: {
                        if langIcon == "vie"{
                            langIcon = "eng"
                        }
                        else{
                            langIcon = "vie"
                        }
                        quizManager.changeLanguage()
                        print(langIcon)
                    }, label: {
                        Image(langIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:100)
                    })
                    
                    
                    
                }
                .padding(.top, 50)
                .padding(.horizontal, 50)
                
                VStack(spacing: 50){
                    Text(langIcon == "vie" ? "VƯỢT CHƯỚNG NGẠI VẬT" : "ECO RACE")
                        .LargeTitle()
                    
                    Text(langIcon == "vie" ? "SẴN SÀNG CHƯA NÀO?" : "ARE YOU READY")
                        .Title()
                    
                    NavigationLink(destination: TriviaView().environmentObject(quizManager)) {
                        PrimaryButton(text: "Let's go")
                    }
                    .onAppear {
                        quizManager.resetGame()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer()
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

//
//  PrimaryButton.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    var foreground: Color = Color.white
    
    @State private var isHovered = false
    
    var body: some View {
        Text(text)
            .font(.custom("Saira-SemiBold", size: 30))
            .foregroundColor(foreground)
            .padding()
            .padding(.horizontal,50)
            .background(background)
            .cornerRadius(20)
            .shadow(color: .black, radius: isHovered ? 10 : 5, y: isHovered ? 10 : 5)
            .onHover { over in
                withAnimation {
                    isHovered = over
                }
            }
    }
}

#Preview {
    PrimaryButton(text: "Next")
}


//
//  Explanation.swift
//  LeggoQuiz
//
//  Created by hhhh on 25/11/2023.
//

import SwiftUI

struct Explanation: View {
    var text: AttributedString = "Your explanation text goes here, Your explanation text goes here, Your explanation text goes here. Your explanation text goes here"
    var mascot: Int = 0
    
    var imageSource: String {
        switch mascot {
        case 1:
            return "eco_round"
        case 2:
            return "emo_round"
        case 3:
            return "hacco_round"
        default:
            return "techno_round"
        }
    }
    
    
    
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 15) {
                
                Image(imageSource)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100) // Increase the frame size for better visibility
                
                Text(text)
                    .Explanation() // Adjust the font size as needed
            }
            .padding()
            .background(Color("lightGray"))
            
            .cornerRadius(20)
        }
        .shadow(radius: 5, y: 5)
    }
}


#Preview {
    Explanation()
}

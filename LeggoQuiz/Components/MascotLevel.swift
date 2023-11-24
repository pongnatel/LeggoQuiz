//
//  MascotLevel.swift
//  LeggoQuiz
//
//  Created by hhhh on 24/11/2023.
//

import SwiftUI

struct MascotLevel: View {
    var mascot: String
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color(mascot+"_bg")) // Change color as needed
                
                Image(mascot) // Replace with your image name
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2) // Adjust image size as needed
                    .foregroundColor(.yellow) // Change color as needed
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MascotLevel(mascot: "eco")
}

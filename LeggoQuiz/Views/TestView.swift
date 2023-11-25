//
//  TestView.swift
//  LeggoQuiz
//
//  Created by hhhh on 24/11/2023.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0){
                Text("Hello, **SwiftLee** readers!")
                    .background(.green)
                Text("Hello2")
                    .background(.red)
            }
            .frame(maxWidth: geometry.size.width * 0.7, maxHeight: geometry.size.width * 0.8)
            .background(Color(.red))
            .position(x: geometry.size.width/2)
        }
        
    }
}

#Preview {
    TestView()
}

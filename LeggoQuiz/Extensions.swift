//
//  Extensions.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import Foundation
import SwiftUI

extension Text{
    func lilacTitle() -> some View{
        self.font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}

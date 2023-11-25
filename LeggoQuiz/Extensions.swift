//
//  Extensions.swift
//  LeggoQuiz
//
//  Created by hhhh on 23/11/2023.
//

import Foundation
import SwiftUI

extension Text{
    func LargeTitle() -> some View{
        self.font(Font.custom("Saira-ExtraBold", size: 60))
            .foregroundColor(Color.black)
    }
    
    func Title() -> some View{
        self.font(Font.custom("Saira-SemiBold", size: 30))
//            .foregroundColor(Color.black)
    }
    
    func Choice() -> some View{
        self.font(Font.custom("Saira-Regular", size: 25))
            .foregroundColor(Color.white)
    }
    
    func Explanation() -> some View{
        self.font(Font.custom("Saira-Regular", size: 25))
            .foregroundColor(Color.black)
    }
}


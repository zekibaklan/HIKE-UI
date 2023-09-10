//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Zeki Baklan on 2.09.2023.
//

import Foundation
import SwiftUI
struct GradientButton : ButtonStyle {
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal , 30)
            
            .background(
                //Conditional Statemnt with Nil Coalescing
                // Condition ? A: B
                configuration.isPressed ?
                // A : When user pressed Button
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                // B : When the Button is not pressed
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
        
            .cornerRadius(40)
           
    }
    
}

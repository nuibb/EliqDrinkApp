//
//  ImageExtension.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/21/22.
//

import Foundation
import SwiftUI

extension Image {
    func imageModifier(lineWidth: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.white, lineWidth: lineWidth))
            .transition(.scale)
        //.frame(width: 100.0, height: 100.0)
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier(lineWidth: 2.0)
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}


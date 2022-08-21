//
//  TextExtension.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/21/22.
//

import Foundation
import SwiftUI

extension Text {
    func headerTextModifier() -> some View {
        self
            .background(.clear)
            .foregroundColor(.white)
            .font(.largeTitle.weight(.bold))
            //.border(.red)
    }
    
    func descriptionTextModifier() -> some View {
        self
            .foregroundColor(.white)
            .font(.body.weight(.light))
            //.border(.blue)
            .multilineTextAlignment(.leading)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading)
    }
    
    func itemTextModifier() -> some View {
        self
            .foregroundColor(.white)
            .font(.title3.weight(.heavy))
            .multilineTextAlignment(.leading)
            .frame(
                maxWidth: .infinity,
                alignment: .topLeading)
    }
}

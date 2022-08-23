//
//  PropertyList.swift
//  EliqDrinkApp
//
//  Created by ReliSource Technologies Ltd. on 8/22/22.
//

import Foundation

extension NSObject {
    func propertyNames() -> [String] {
        let mirror = Mirror(reflecting: self)
        return mirror.children.compactMap{ $0.label }
    }
}

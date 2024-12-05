//
//  UIFont+Extensions.swift
//  HNApp
//
//  Created by Brayan Munoz on 4/12/24.
//

import SwiftUI

extension Font {
    
    enum Inter: String {
        case regular = "Inter-Regular"
        case medium = "Inter-Medium"
        case bold = "Inter-Bold"
        
        func font(size: CGFloat) -> Font {
            .custom(self.rawValue, size: size)
        }
    }
    
    static func interRegular(size: CGFloat) -> Font {
        Inter.regular.font(size: size)
    }
    
    static func interMedium(size: CGFloat) -> Font {
        Inter.medium.font(size: size)
    }
    
    static func interBold(size: CGFloat) -> Font {
        Inter.bold.font(size: size)
    }
}

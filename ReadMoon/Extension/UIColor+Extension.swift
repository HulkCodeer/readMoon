//
//  File.swift
//  usedMarket
//
//  Created by  주완 김 on 2018. 6. 7..
//  Copyright © 2018년  주완 김. All rights reserved.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        let r: CGFloat = .init(arc4random_uniform(255)) / 255.0
        let g: CGFloat = .init(arc4random_uniform(255)) / 255.0
        let b: CGFloat = .init(arc4random_uniform(255)) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    /// hex 숫자 값 으로 색상 적용
    ///
    /// - Parameters:
    ///   - hex: hex 숫자 값
    ///   - alpha: alpha 값
    public convenience init(hex: Int, alpha: Double = 1.0) {
        let r = CGFloat((hex & 0xff0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00ff00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000ff) / 255.0
        self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
    
    /// hex string 값으로 색상 적용
    ///
    /// - Parameters:
    ///   - rgbHexString: hex string 값
    ///   - alpha: alpha 값
    public convenience init?(rgbHexString: String, alpha: Double = 1.0) {
        let scanner = Scanner(string: rgbHexString.replacingOccurrences(of: "#", with: ""))
        var rgbHex: UInt32 = 0
        guard scanner.scanHexInt32(&rgbHex) else {
            return nil
        }
        self.init(hex: Int(rgbHex), alpha: alpha)
    }
    
    @nonobjc convenience init(red: Int, green: Int, blue: Int, alpha: Double = 1.0) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: CGFloat(alpha))
    }
    
    @nonobjc convenience init(r: UInt, g: UInt, b: UInt, a: CGFloat = 1) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
}

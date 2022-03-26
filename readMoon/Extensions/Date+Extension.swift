//
//  Date+Extension.swift
//  readMoon
//
//  Created by 박현진 on 2022/03/27.
//

import Foundation

extension Date {
    func toString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}

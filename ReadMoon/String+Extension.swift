//
//  String+Extension.swift
//  usedMarket
//
//  Created by  주완 김 on 2018. 6. 29..
//  Copyright © 2018년  주완 김. All rights reserved.
//

import Foundation

extension String {
    func toDate(dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date: Date? = dateFormatter.date(from: self)
        return date
    }
}

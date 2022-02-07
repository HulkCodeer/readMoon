//
//  Date+Extension.swift
//  usedMarket
//
//  Created by  주완 김 on 2018. 7. 5..
//  Copyright © 2018년  주완 김. All rights reserved.
//

import Foundation

extension Date {
    func toString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
    func toKorString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "ko-KR")
        return dateFormatter.string(from: self)
    }
        
    internal func betweenDays(start: Date, end: Date) -> Int {
        Calendar.current.dateComponents([.day], from: start, to: end).day ?? 0
    }
    
    private func makeDateFrom(year: Int, month: Int, day: Int) -> Date {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let date = gregorianCalendar.date(from: dateComponents)!
        return date
    }
}

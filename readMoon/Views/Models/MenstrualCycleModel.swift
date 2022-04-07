//
//  MenstrualCycleModel.swift
//  readMoon
//
//  Created by 박현진 on 2022/03/31.
//

import RealmSwift
import Foundation

internal final class MenstrualCycleModel: Object {
    @Persisted var menstrualCycleDate: Date
    @Persisted var menstrualCycleDay: Int
}

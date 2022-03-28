//
//  HomeViewModel.swift
//  readMoon
//
//  Created by 박현진 on 2022/03/28.
//

import Foundation

enum TabBarType {
    case calendar
    case statistics
    case setting
}

internal class HomeViewModel: CommonViewModel {
    @Published var tabBarType: TabBarType = .calendar
}

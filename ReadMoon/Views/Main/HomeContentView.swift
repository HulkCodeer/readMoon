//
//  HomeContentView.swift
//  readMoon
//
//  Created by 박현진 on 2022/03/24.
//

import SwiftUI

struct HomeContentView: View {
    
    enum CalendarWeekTitleType: String, CaseIterable {
        case sun = "SUN"
        case mon = "MON"
        case tue = "TUE"
        case wed = "WED"
        case thu = "THU"
        case fri = "FRI"
        case sat = "SAT"
    }
    
    // MARK: STATE
    @ObservedObject var viewModel: HomeViewModel
    @State var calendarDayArray: [String] = []
    @State var clickDay: String = ""
    @State var today: String = Date().toString(dateFormat: "yyyy년 MM월")
    @State var currentDate: Date = Date()
    @State var calendarReload: Bool = false
            
    // MARK: VARIABLE
    let colums = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image("calendarIcon")
                    .frame(width: 32, height: 32)
                
                Text("캘린더")
                    .font(Font.system(size: 24, weight: .bold))
                    .padding(.leading, 6)
                    .padding(.trailing, 8)
                
                Image("calendarGuideIcon")
                    .frame(width: 24, height: 24)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
            .padding(.leading, 20)
            
            HStack {
                Button(action: {
                    self.currentDate = Calendar.current.date(byAdding: .month, value: -1, to: self.currentDate)!
                    self.calendarReload = true
                }, label: {
                    Image("calendarLeftArrow")
                })
                .frame(width: 30, height: 30)
                
                Spacer()
                
                Text(self.currentDate.toString(dateFormat: "yyyy년 MM월"))
                    .font(Font.system(size: 20, weight: .bold))
                
                Spacer()
                
                Button(action: {
                    self.currentDate = Calendar.current.date(byAdding: .month, value: 1, to: self.currentDate)!
                    self.calendarReload = true
                }, label: {
                    Image("calendarRightArrow")
                })
                .frame(width: 30, height: 30)
            }
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            HStack(spacing: 0) {
                ForEach(CalendarWeekTitleType.allCases, id: \.self) {
                    Text("\($0.rawValue)")
                        .font(Font.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity, minHeight: 32, alignment: .center)
                }
            }
            .padding(.leading, 11)
            .padding(.trailing, 10)
                        
            
            LazyVGrid(columns: self.colums) {
                if calendarReload {
                    ForEach(self.calendarDayArray, id: \.self) {data in
                        let date = data.toDate(dateFormat: "yyyy-MM-dd") ?? Date()
                        let isToday = self.compareToday(compareDate: date)
                        
                        Button(action: {
                            self.clickDay = date.toString(dateFormat: "yyyy년 MM월 dd일")
                        }, label: {
                            Text("\(date.toString(dateFormat: "d"))")
                                .frame(minWidth: 48, minHeight: 60)
                                .background(Color(red: 247 / 255, green: 247 / 255, blue: 247 / 255))
                                .foregroundColor(isToday ? Color(red: 24 / 255, green: 24 / 255, blue: 24 / 255) : Color(red: 108 / 255, green: 108 / 255, blue: 108 / 255))
                        })
                    }
                }
            }
            .frame(maxWidth: .infinity, minHeight: 200)
            .padding(.leading, 11)
            .padding(.trailing, 10)
            .onAppear(perform: {
                self.calendarReload = false
            })
            
            HStack {
                Text("\(self.clickDay) \n메모없음")
                    .frame(minWidth: 0,
                           idealWidth: 300,
                           maxWidth: .infinity,
                           minHeight: 0,
                           idealHeight: 66,
                           maxHeight: 66,
                           alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.trailing, 8)
                    .background(Color(red: 247 / 255, green: 247 / 255, blue: 247 / 255))
                                                
                Image("memoIcon")
                    .frame(width: 56, height: 56)
                    .padding(.trailing, 10)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 66, alignment: .center)
            .padding(.leading, 11)
            .padding(.top, 10)
            
            Spacer()
            
            MainTabBar(selectedTabBarType: $viewModel.tabBarType)
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear(perform: fetch)
    }
    
    private func compareToday(compareDate: Date) -> Bool {
        return Date().toString(dateFormat: "yyyy-MM-dd") == compareDate.toString(dateFormat: "yyyy-MM-dd")
    }
    
    private func fetch() {
        self.calendarDayArray.removeAll()
        
        let dateFormatter = DateFormatter()
        let date = self.currentDate
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let calendar = Calendar.current
        let startComponents = calendar.dateComponents([.year, .month], from: date)
        let startOfMonth = calendar.date(from: startComponents)!

        var endComponents = DateComponents()
        endComponents.month = 1
        endComponents.day = -1
        
        let endOfMonth = calendar.date(byAdding: endComponents, to: startOfMonth) ?? Date()
        
        let startOfWeekDay = calendar.component(.weekday, from: startOfMonth) - 1
        var addingDate = startOfMonth

        // 6주 기준 42일
        for i in 0 ..< 42 {
            if i < startOfWeekDay {
                var minusComponents = DateComponents()
                minusComponents.day = i - startOfWeekDay
                if let _minusDate = calendar.date(byAdding: minusComponents, to: startOfMonth) {
                    self.calendarDayArray.append(dateFormatter.string(from: _minusDate))
                }
            } else if i == startOfWeekDay {
                self.calendarDayArray.append(dateFormatter.string(from: startOfMonth))
            } else {
                var addComponents = DateComponents()
                addComponents.day = 1
                if let _addingDate = calendar.date(byAdding: addComponents, to: addingDate) {
                    addingDate = _addingDate
                    let compareResult = calendar.compare(_addingDate, to: endOfMonth, toGranularity: .month)
                    if compareResult == .orderedSame {
                        self.calendarDayArray.append(dateFormatter.string(from: _addingDate))
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
        }
        
        self.calendarReload = true
    }
}


struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView(viewModel: HomeViewModel())
    }
}

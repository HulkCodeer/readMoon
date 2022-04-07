//
//  MainTabBar.swift
//  readMoon
//
//  Created by 박현진 on 2022/03/25.
//

import SwiftUI

struct MainTabBar: View {
    @Binding var selectedTabBarType: TabBarType
    
    var body: some View {
        HStack(spacing: 18) {
            Button {                
                self.selectedTabBarType = .calendar
            } label: {
                VStack(spacing: 0) {
                    Image( self.selectedTabBarType == .calendar ? "calendarIconOn" : "calendarIconOff")
                        .padding(.bottom, 3)
                    
                    let color = self.selectedTabBarType == .calendar ? Color(red: 24 / 255, green: 24 / 255, blue: 24 / 255) : Color(red: 199 / 255, green: 199 / 255, blue: 199 / 255)
                    
                    Text("캘린더")
                        .font(Font.system(size: 13, weight: .bold))
                        .foregroundColor(color)
                }
            }.frame(maxWidth: 100, maxHeight: 54)
            
            Button {
                self.selectedTabBarType = .statistics
            } label: {
                VStack(spacing: 0) {
                    Image( self.selectedTabBarType == .statistics ? "statisticsIconOn" : "statisticsIconOff")
                        .padding(.bottom, 3)
                    
                    let color = self.selectedTabBarType == .statistics ? Color(red: 24 / 255, green: 24 / 255, blue: 24 / 255) : Color(red: 199 / 255, green: 199 / 255, blue: 199 / 255)
                    
                    Text("통계")
                        .font(Font.system(size: 13, weight: .bold))
                        .foregroundColor(color)
                }
            }.frame(maxWidth: 100, maxHeight: 54)
            
            Button {
                self.selectedTabBarType = .setting
            } label: {
                VStack(spacing: 0) {
                    Image( self.selectedTabBarType == .setting ? "settingIconOn" : "settingIconOff")
                        .padding(.bottom, 3)
                    
                    let color = self.selectedTabBarType == .setting ? Color(red: 24 / 255, green: 24 / 255, blue: 24 / 255) : Color(red: 199 / 255, green: 199 / 255, blue: 199 / 255)
                    
                    Text("설정")
                        .font(Font.system(size: 13, weight: .bold))
                        .foregroundColor(color)
                }
            }.frame(maxWidth: 100, maxHeight: 54)
        }
        .background(Image("bottomTabBarBackground"))
        .frame(maxWidth: .infinity, maxHeight: 112, alignment: .center)
    }
}

#if DEBUG
struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar(selectedTabBarType: .constant(.calendar))
    }
}
#endif

internal struct TabbarButton: View {
    @Binding var isCheck: Bool
    var body: some View {
        VStack(spacing: 0) {
            Image( self.isCheck ? "settingIconOn" : "settingIconOff")
                .padding(.bottom, 3)
            
            let color = self.isCheck ? Color(red: 24 / 255, green: 24 / 255, blue: 24 / 255) : Color(red: 199 / 255, green: 199 / 255, blue: 199 / 255)
            
            Text("설정")
                .font(Font.system(size: 13, weight: .bold))
                .foregroundColor(color)
        }
    }
}

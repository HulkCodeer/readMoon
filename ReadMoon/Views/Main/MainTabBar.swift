//
//  MainTabBar.swift
//  readMoon
//
//  Created by 박현진 on 2022/03/25.
//

import SwiftUI

struct MainTabBar: View {
    @Binding var isCheck: Bool
    
    var body: some View {
        HStack(spacing: 18) {
            Button {
                self.isCheck.toggle()
            } label: {
                VStack(spacing: 0) {
                    Image( self.isCheck ? "calendarIconOn" : "calendarIconOff")
                        .padding(.bottom, 3)
                    
                    let color = self.isCheck ? Color(red: 24 / 255, green: 24 / 255, blue: 24 / 255) : Color(red: 199 / 255, green: 199 / 255, blue: 199 / 255)
                    
                    Text("캘린더")
                        .font(Font.system(size: 13, weight: .bold))
                        .foregroundColor(color)
                }
            }.frame(maxWidth: 100, maxHeight: 54)
            
            Button {
                self.isCheck.toggle()
            } label: {
                VStack(spacing: 0) {
                    Image( self.isCheck ? "statisticsIconOn" : "statisticsIconOff")
                        .padding(.bottom, 3)
                    
                    let color = self.isCheck ? Color(red: 24 / 255, green: 24 / 255, blue: 24 / 255) : Color(red: 199 / 255, green: 199 / 255, blue: 199 / 255)
                    
                    Text("통계")
                        .font(Font.system(size: 13, weight: .bold))
                        .foregroundColor(color)
                }
            }.frame(maxWidth: 100, maxHeight: 54)
            
            Button {
                self.isCheck.toggle()
            } label: {
                VStack(spacing: 0) {
                    Image( self.isCheck ? "settingIconOn" : "settingIconOff")
                        .padding(.bottom, 3)
                    
                    let color = self.isCheck ? Color(red: 24 / 255, green: 24 / 255, blue: 24 / 255) : Color(red: 199 / 255, green: 199 / 255, blue: 199 / 255)
                    
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
        MainTabBar(isCheck: .constant(false))
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

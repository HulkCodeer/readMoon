//
//  HomeContentView.swift
//  readMoon
//
//  Created by 박현진 on 2022/03/24.
//

import SwiftUI

struct HomeContentView: View {
    
    @State var isCheck = false
    
    var body: some View {
        VStack {
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
                    
                }, label: {
                    Image("calendarLeftArrow")
                })
                .frame(width: 30, height: 30)
                
                Spacer()
                
                Text("2021년 10월")
                    .font(Font.system(size: 20, weight: .bold))
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image("calendarRightArrow")
                })
                .frame(width: 30, height: 30)
            }
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            
            Spacer()
            
            HStack {
                Text("2021년 10월 20일 \n메모없음")
                    .frame(minWidth: 0,
                           idealWidth: 300,
                           maxWidth: .infinity,
                           minHeight: 0,
                           idealHeight: 66,
                           maxHeight: 66,
                           alignment: .leading)
                    .padding(.leading, 11)
                    .padding(.trailing, 8)
                                                
                Image("memoIcon")
                    .frame(width: 56, height: 56)
                    .padding(.trailing, 10)
                
            }.frame(maxWidth: .infinity, maxHeight: 66, alignment: .center)
            
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
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}

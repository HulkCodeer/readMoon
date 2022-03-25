//
//  HomeContentView.swift
//  readMoon
//
//  Created by 박현진 on 2022/03/24.
//

import SwiftUI

struct HomeContentView: View {
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
            .frame(width: .infinity, height: 60, alignment: .center)
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
            .frame(width: .infinity, height: 60, alignment: .center)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            Spacer()
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}

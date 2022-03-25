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
            HStack {
                Image("calendarIcon")
                    .frame(width: 32, height: 32)                
                Text("캘린더")
                    .font(Font.system(size: 24, weight: .bold))
                Image("calendarGuideIcon")
                    .frame(width: 24, height: 24)
                Spacer()
            }
            
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}

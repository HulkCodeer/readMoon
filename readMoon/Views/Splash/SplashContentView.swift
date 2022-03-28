//
//  SplashContentview.swift
//  readMoon
//
//  Created by 박현진 on 2022/03/24.
//

import SwiftUI

struct SplashContentView: View {
    @State var isActive: Bool = false
    
    var body: some View {        
        if isActive {
            let viewModel = HomeViewModel()
            HomeContentView(viewModel: viewModel)
        } else {
            Image("splashIcon")
                .frame(width: 186, height: 237)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            self.isActive.toggle()
                        }
                    }
                }
        }
    }
}

struct SplashContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashContentView()
    }
}

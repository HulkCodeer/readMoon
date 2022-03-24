//
//  SplashContentview.swift
//  readMoon
//
//  Created by 박현진 on 2022/03/24.
//

import SwiftUI

struct SplashContentView: View {
    var body: some View {
        Image("splashIcon")
            .frame(width: 186, height: 237)
    }.onAppear(perform: <#T##(() -> Void)?#>)
}

struct SplashContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashContentView()
    }
}

//
//  Popup.swift
//  readMoon
//
//  Created by 박현진 on 2022/04/06.
//

import SwiftUI

internal struct Popup<PopupContent>: ViewModifier where PopupContent: View {
    @Binding var isPresented: Bool
    
    var view: () -> PopupContent
    
    init(isPresented: Binding<Bool>, view: @escaping () -> PopupContent) {
        self._isPresented = isPresented
        self.view = view
    }
    
    internal func body(content: Content) -> some View {
        ZStack {
            content
        }
    }        
}

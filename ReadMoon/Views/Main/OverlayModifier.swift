//
//  OverlayModifier.swift
//  readMoon
//
//  Created by 박현진 on 2022/04/19.
//

import SwiftUI

struct OverlayModifier<OverlayView: View>: ViewModifier {
    
    @Binding var isOpen: Bool
    @ViewBuilder var overlayView: () -> OverlayView
    
    init(isOpen: Binding<Bool>, @ViewBuilder overlayView: @escaping() -> OverlayView) {
        self._isOpen = isOpen
        self.overlayView = overlayView
    }
    
    func body(content: Content) -> some View {        
        content.overlay(isOpen ? overlayView() : nil)
    }
}

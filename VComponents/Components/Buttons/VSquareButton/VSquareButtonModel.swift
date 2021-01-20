//
//  VSquareButtonModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import SwiftUI

// MARK:- V Square Button Model
/// Model that describes UI
public struct VSquareButtonModel {
    public var layout: Layout = .init()
    public var colors: Colors = .init()
    public var font: Font = .system(size: 14, weight: .semibold, design: .default)  // Only applicable during init with title
    
    public init() {}
}

// MARK:- Layout
extension VSquareButtonModel {
    public struct Layout {
        public var dimension: CGFloat = 56
        public var cornerRadius: CGFloat = 16
        
        public var borderWidth: CGFloat = 0
        var hasBorder: Bool { borderWidth > 0 }
        
        public var contentMarginHor: CGFloat = 3
        public var contentMarginVer: CGFloat = 3
        
        public var hitBoxHor: CGFloat = 0
        public var hitBoxVer: CGFloat = 0
        
        public init() {}
    }
}

// MARK:- Colors
extension VSquareButtonModel {
    public struct Colors {
        public static let primaryButtonColors: VPrimaryButtonModel.Colors = .init()
        
        public var content: StateOpacity = .init(
            pressedOpacity: 0.5,
            disabledOpacity: 0.5
        )
        
        public var textContent: StateColors = .init(   // Only applicable during init with title
            enabled: primaryButtonColors.textContent.enabled,
            pressed: primaryButtonColors.textContent.pressed,
            disabled: primaryButtonColors.textContent.disabled
        )
        
        public var background: StateColors = .init(
            enabled: primaryButtonColors.background.enabled,
            pressed: primaryButtonColors.background.pressed,
            disabled: primaryButtonColors.background.disabled
        )
        
        public var border: StateColors = .init(
            enabled: primaryButtonColors.border.enabled,
            pressed: primaryButtonColors.border.pressed,
            disabled: primaryButtonColors.border.disabled
        )
        
        public init() {}
    }
}

extension VSquareButtonModel.Colors {
    public typealias StateColors = VSecondaryButtonModel.Colors.StateColors
    
    public typealias StateOpacity = VSecondaryButtonModel.Colors.StateOpacity
}

extension VSquareButtonModel.Colors.StateColors {
    func `for`(_ state: VSquareButtonInternalState) -> Color {
        switch state {
        case .enabled: return enabled
        case .pressed: return pressed
        case .disabled: return disabled
        }
    }
}

extension VSquareButtonModel.Colors.StateOpacity {
    func `for`(_ state: VSquareButtonInternalState) -> Double {
        switch state {
        case .enabled: return 1
        case .pressed: return pressedOpacity
        case .disabled: return disabledOpacity
        }
    }
}

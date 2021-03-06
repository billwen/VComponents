//
//  LayoutGroup.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 2/9/21.
//

import SwiftUI

/// Grop of layout values containing `leading`, `trailing`, `top` and `bottom` values
public struct LayoutGroupLTTB {
    /// Leading value
    public var leading: CGFloat
    
    /// Trailing value
    public var trailing: CGFloat
    
    /// Top value
    public var top: CGFloat
    
    /// Bottom value
    public var bottom: CGFloat
    
    /// Initializes group with value
    public init(leading: CGFloat, trailing: CGFloat, top: CGFloat, bottom: CGFloat) {
        self.leading = leading
        self.trailing = trailing
        self.top = top
        self.bottom = bottom
    }
}

/// Grop of layout values containing `horizotal` and `vertical` values
public struct LayoutGroupHV {
    /// Horizontal value
    public var horizontal: CGFloat
    
    /// Vertical value
    public var vertical: CGFloat
    
    /// Initializes group with values
    public init(horizontal: CGFloat, vertical: CGFloat) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
}

/// Grop of layout values containing `top` and `bottom` values
public struct LayoutGroupTB {
    /// Top value
    public var top: CGFloat
    
    /// Bottom value
    public var bottom: CGFloat
    
    /// Initializes group with values
    public init(top: CGFloat, bottom: CGFloat) {
        self.top = top
        self.bottom = bottom
    }
}

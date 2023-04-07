//
//  FontExtension+Properties.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/7/23.
//

import Foundation
import SwiftUI

extension Font  {
    public static func openSans(size fontSize : CGFloat = 12, weight fontWeight : OpenSansFontWeight = .regular) -> Font{
        return Font.custom(fontWeight.rawValue, size: fontSize)
    }
}

public enum OpenSansFontWeight : String {
    case bold = "OpenSans-Bold"
    case boldItalic = "OpenSans-BoldItalic"
    case extraBold = "OpenSans-ExtraBold"
    case extraBoldItalic = "OpenSans-ExtraBoldItalic"
    case italic = "OpenSans-Italic"
    case light = "OpenSans-Light"
    case lightItalic = "OpenSans-LightItalic"
    case medium = "OpenSans-Medium"
    case mediumItalic = "OpenSans-MediumItalic"
    case regular = "OpenSans-Regular"
    case semiBold = "OpenSans-SemiBold"
    case semiBoldItalic = "OpenSans-SemiBoldItalic"
}

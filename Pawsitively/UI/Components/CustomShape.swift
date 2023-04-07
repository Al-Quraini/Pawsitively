//
//  CustomPath.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/7/23.
//

import Foundation
import SwiftUI

struct CustomShape : Shape {
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        return Path(path.cgPath)
    }
    
    
}

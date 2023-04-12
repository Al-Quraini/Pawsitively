//
//  SafeArea.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/11/23.
//

import UIKit

struct SafeArea {
    static var top : CGFloat {
        getSafeArea()?.top ?? 0
    }
    static var left : CGFloat {
        getSafeArea()?.left ?? 0
    }
    static var right : CGFloat {
        getSafeArea()?.right ?? 0
    }
    static var bottom : CGFloat {
        getSafeArea()?.bottom ?? 0
    }
    
    private static func getSafeArea() -> UIEdgeInsets? {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        return (keyWindow?.safeAreaInsets)
    }
}

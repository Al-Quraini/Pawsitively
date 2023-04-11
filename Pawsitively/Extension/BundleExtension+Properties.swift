//
//  BundleExtension+Properties.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/9/23.
//

import Foundation

extension Bundle {
    static func getFilePath(for fileName: String, fileType: String) -> String? {
        return main.path(forResource: fileName, ofType: fileType)
    }
}

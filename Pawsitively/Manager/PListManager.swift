//
//  PListManager.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/9/23.
//

import Foundation

struct PListManager {
    func getValueFromPList<T>(from file: String, for key: String) -> T? {
        if let path = Bundle.getFilePath(for: file, fileType: "plist"),
           let dictionary = NSDictionary(contentsOfFile: path) {
            return dictionary[key] as? T
        }
        return nil
    }
}

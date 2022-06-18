//
//  FileManager-DocumentsDirectory.swift
//  FaceList
//
//  Created by Yi An Chen on 2022/3/16.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

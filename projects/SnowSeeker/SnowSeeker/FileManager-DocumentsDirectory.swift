//
//  FileManager-DocumentsDirectory.swift
//  SnowSeeker
//
//  Created by Yi An Chen on 2022/3/27.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by naseem on 15/02/2022.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

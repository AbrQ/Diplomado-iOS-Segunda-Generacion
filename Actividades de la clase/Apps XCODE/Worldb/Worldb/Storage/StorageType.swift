//
//  StorageType.swift
//  Worldb
//
//  Created by Abraham Quezada on 10/2/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import Foundation

enum StorageType {
    case cache
    case permanent
    
    var searchPathDirectory: FileManager.SearchPathDirectory {
        switch self {
        case .cache: return .cachesDirectory
        case .permanent: return .documentDirectory
        }
    }
    
    var folder: URL {
        var url = FileManager.default.urls(for: searchPathDirectory, in: .userDomainMask).first!
        let subfolder = "mx.unam.worldb.storage"
        url.appendPathComponent(subfolder)
        return url
    }
    
    func clearStorage() {
        try? FileManager.default.removeItem(at: folder)
    }
    
    func ensureExists() {
        let fileManager = FileManager.default
        var isDir: ObjCBool = false
        if fileManager.fileExists(atPath: folder.path, isDirectory: &isDir) {
            if isDir.boolValue { return }
            try? fileManager.removeItem(at: folder)
        }
        try? fileManager.createDirectory(at: folder, withIntermediateDirectories: false, attributes: nil)
    }
}

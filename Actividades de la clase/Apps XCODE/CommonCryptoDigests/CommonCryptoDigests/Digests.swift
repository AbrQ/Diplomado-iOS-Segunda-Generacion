//
//  Digests.swift
//  CommonCryptoDigests
//
//  Created by Abraham Quezada on 10/6/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import Foundation

class Digests{
    class func sha1(string: String) -> String {
        let data = string.data(using: .utf8)!
        return sha1(data:data)
    }
    
    class func sha1(data: Data) -> String {
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
    
    class func sha1(data: Data) -> [UInt8] {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0, CC_LONG(data.count), &digest)
        }
        return digest
    }
}

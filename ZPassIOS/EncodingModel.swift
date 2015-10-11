//
//  EncodingModel.swift
//  ZPassIOS
//
//  Created by João Lopes on 2015/10/03.
//  Copyright © 2015 João Lopes. All rights reserved.
//

import Foundation

class EncodingModel {
    var salt: String
    var secret: String
    var url: String
    
    var password: String {
        get {
            return genPass(salt, input: url, pass: secret)
        }
    }
    
    init(salt: String, secret: String, url: String) {
        self.salt = salt
        self.secret = secret
        self.url = url
    }
    
}

func genPass(salt: String, input: String, pass: String) -> String {
    let prehash = salt+"@"+input+":"+pass
    let str = prehash.cStringUsingEncoding(NSUTF8StringEncoding)
    let strLen = Int32(prehash.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
    let digestLenInt: Int = Int(CC_SHA256_DIGEST_LENGTH)
    
    let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLenInt)
    
    CC_SHA256(str!, UInt32(bitPattern: strLen), result)
   
    let digest = stringFromResult(result, length: digestLenInt)
    result.dealloc(digestLenInt)

    return digest
}

private func stringFromResult(result: UnsafeMutablePointer<CUnsignedChar>, length: Int) -> String {
    let bla = NSMutableData()
    bla.appendBytes(result, length: length)
    let bla64 = bla.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    return String(bla64)
}

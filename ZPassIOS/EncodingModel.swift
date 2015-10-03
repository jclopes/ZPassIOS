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
    let prehash = (salt+"@"+input+":"+pass as NSString).dataUsingEncoding(NSUTF8StringEncoding)
    return prehash!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
}

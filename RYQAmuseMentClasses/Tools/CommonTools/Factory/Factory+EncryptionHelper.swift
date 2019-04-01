//
//  Factory+EncryptionHelper.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/23.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation


/**
 处理 加密、base64、MD5、SHA1
 */
extension Factory{
    ///=========== swift Base64编码解码==========
    
    /**
     Base64编码
     */
    class func base64Encoding(str:String)->String{
        let strData = str.data(using: String.Encoding.utf8)
        let base64String = strData?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        return base64String!
    }
    /**
     Base64解码
     */
    class func base64Decoding(encodedStr:String)->String{
        let decodedData = NSData(base64Encoded: encodedStr, options: NSData.Base64DecodingOptions.init(rawValue: 0))
        let decodedString = NSString(data: decodedData! as Data, encoding: String.Encoding.utf8.rawValue)! as String
        return decodedString
    }
}

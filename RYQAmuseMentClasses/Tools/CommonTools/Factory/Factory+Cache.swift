//
//  Factory+Cache.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/23.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation
/**
 主要处理App的缓存
 */
extension Factory {
    
    /**
     获取App的缓存大小
     */
    class func getCacheSize()-> String {
        // 取出cache文件夹目录
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
        
        // 取出文件夹下所有文件数组
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        
        //快速枚举出所有文件名 计算文件大小
        var size = 0
        for file in fileArr! {
            
            // 把文件名拼接到路径中
            let path = cachePath! + ("/\(file)")
            // 取出文件属性
            let floder = try! FileManager.default.attributesOfItem(atPath: path)
            // 用元组取出文件大小属性
            for (key, fileSize) in floder {
                // 累加文件大小
                if key == FileAttributeKey.size {
                    size += (fileSize as AnyObject).integerValue
                }
            }
        }
        
        let totalCache = Double(size) / 1024.00 / 1024.00
        return String(format: "%.2fM", totalCache)
    }
    
    /**
     删除App的缓存
     */
    class func clearCache() {
        // 取出cache文件夹目录
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
        
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        
        // 遍历删除
        
        for file in fileArr! {
            
            let path = (cachePath! as NSString).appending("/\(file)")
            
            if FileManager.default.fileExists(atPath: path) {
                
                do {
                    
                    try FileManager.default.removeItem(atPath: path)
                    
                } catch {

                }
                
            }
            
        }
    }
}

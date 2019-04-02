//
//  Factory+SystemHelper.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/23.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation

/**
 获取应用名称、应用版本、设备型号、系统版本等信息
 */
extension Factory {
    
    
    /// 获取应用名称、应用版本、设备型号、系统版本等信息
    enum systemInfo {
        case appName/// - appName: 程序名称
        case majorVersion/// - majorVersion: 主程序版本号
        case minorVersion/// - minorVersion: 版本号（内部标示）
        case iosVersion/// - iosVersion: iOS版本
        case identifierNumber/// - identifierNumber: 设备udid
        case systemName/// - systemName: 设备名称
        case model/// - model: 设备型号
    }
    
    class func systemInfomation(type:systemInfo) -> String {
        var info = ""
        let infoDictionary = Bundle.main.infoDictionary!
        
        switch type {
        case .appName:
            info = infoDictionary["CFBundleDisplayName"] as! String
        case .majorVersion:
            info = infoDictionary["CFBundleShortVersionString"] as! String
        case .minorVersion:
            info = infoDictionary["CFBundleVersion"] as! String
        case .iosVersion:
            info = UIDevice.current.systemVersion
        case .identifierNumber:
            info = String(format: "%@", UIDevice.current.identifierForVendor! as CVarArg)
        case .systemName:
            info = UIDevice.current.systemName
        case .model:
            info = UIDevice.current.model
            
        }
        
        return info
    }
    
}

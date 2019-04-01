//
//  SXYNetWork.swift
//  TableView
//
//  Created by 橘子 on 2018/10/31.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

class SXYNetWork: NSObject {
    
    static let work = SXYNetWork()//单例
    let manager = Alamofire.SessionManager.default
    
    /**
     请求结果结构体
     success : 请求是否成功（请求已进入后台） true 成功  false 失败
     json : 请求到的json数据
     error : 请求是否报异常 并且没有 进入后台
     requestURL:请求的URL地址
     */
    struct RequestData {
        var success: Bool?
        var json:String?
        var error:Any
        var requestURL: String?
    }
    
    //请求完成后的闭包回调
    typealias complitionHandler = (RequestData) -> Void
    
//    /**
//     GET请求
//     */
//    func GetRequest(url: String, paramters:Any?, _ handler:@escaping complitionHandler) {
//        let reachAble = SXYNetworkReachability.reachAbility.reachAble//网络状态
//        if reachAble {
//            manager.session.configuration.timeoutIntervalForRequest = 60
//            let model = NSKeyedUnarchiver.unarchiveObject(withFile: UserDataPath) as? LoginModel
//            
//            var token = ""
//            if model?.data?.UserInfo?.UserNo != nil {
//                token = Factory.base64Encoding(str: String(format: "%@:%@", (model?.data?.UserInfo?.UserNo)!,(model?.data?.Token)!))
//            }
//            
//            let headers = [
//                "Authorization":String(format: "token %@", token),
//                "User-Agent":String(format: "StarApp/%@;(iPhone;iOS %@)", Factory.systemInfomation(type: .majorVersion),Factory.systemInfomation(type: .iosVersion))
//                ]
//            var param:[String:Any]?
//            
//            if paramters != nil {
//                param = (paramters as! [String:Any])
//            }
//            
//            //网络连接
//            manager.request(ServicerIPAddress+url, method: .get, parameters: param, encoding: URLEncoding.default, headers: headers).responseString { (response) in
//                
//                var requestJson:String?
//                var requestSuccess:Bool?
//                let requestURL = ServicerIPAddress+url
//                
//                if response.result.isSuccess {
//                    
//                    if let jsonString = response.result.value {
//                        
//                        requestJson = jsonString
//                        
//                        let dataDic = Factory.getDictionaryFromJSONString(jsonString: requestJson!)
//                        let keys = dataDic.allKeys
//                        RYQLog(dataDic)
//                        RYQLog(jsonString)
//                        if keys.count > 0 {
//                            let msg = dataDic.value(forKey: "msg")
//                            let code = dataDic.value(forKey: "code") as? Int
//                            let data = dataDic.value(forKey: "data") as? [String:Any]
//                            
//                            requestSuccess = (code == 200)
//                            
//                            if requestSuccess == false {
//                                if msg != nil {
//                                    //请求失败的提示
//                                    self.requestFailAlter(code: code!, msg: msg as! String)
//                                }
//                            }
//                            if data == nil {
//                                return
//                            }
//                        }
//                    }
//                }else{
//                    //请求后台接口网络请求框架错误
//                    self.NetWorkFaile(error: response.result.error! as NSError)
//                }
//                
//                let data = RequestData(success: requestSuccess,json:requestJson,error:response.result.error as Any,requestURL: requestURL)
//                handler(data)
//            }
//        }else{
//            //网络没有连接
//            
//        }
//    }
//    
//    /**
//     POST请求
//     */
//    func PostRequest(url: String, paramters:Any? , _ handler:@escaping complitionHandler) {
//        manager.session.configuration.timeoutIntervalForRequest = 60
//        let reachAble = SXYNetworkReachability.reachAbility.reachAble//网络状态
//        if reachAble {
//            let model = NSKeyedUnarchiver.unarchiveObject(withFile: UserDataPath) as? LoginModel
//            var headers = ["User-Agent":String(format: "StarApp/%@;(iPhone;iOS %@)", Factory.systemInfomation(type: .majorVersion), Factory.systemInfomation(type: .iosVersion))]
//            if model?.data?.UserInfo?.UserNo != nil {
//                
//                let token = Factory.base64Encoding(str: String(format: "%@:%@", (model?.data?.UserInfo?.UserNo)!,(model?.data?.Token)!))
//                
//                headers = [
//                    "Authorization":String(format: "token %@", token),
//                    "User-Agent":String(format: "StarApp/%@;(iPhone;iOS %@)", Factory.systemInfomation(type: .majorVersion),Factory.systemInfomation(type: .iosVersion))
//                ]
//            }
//            var param:[String:Any]?
//            
//            if paramters != nil {
//                param = (paramters as! [String:Any])
//            }
//            //网络连接
//            manager.request(ServicerIPAddress+url, method: .post, parameters: param, encoding: URLEncoding.default, headers: headers).responseString { (response) in
//                
//                var requestJson:String?
//                var requestSuccess = false
//                let requestURL = ServicerIPAddress+url
//                if response.result.isSuccess {
//                    
//                    if let jsonString = response.result.value {
//                        
//                        requestJson = jsonString
//                        
//                        let dataDic = Factory.getDictionaryFromJSONString(jsonString: requestJson!)
//                        let keys = dataDic.allKeys
//                        RYQLog(dataDic)
//                        RYQLog(jsonString)
//                        if keys.count > 0 {
//                            let msg = dataDic.value(forKey: "msg")
//                            let code = dataDic.value(forKey: "code") as? Int
//                            requestSuccess = (code == 200)
//                            
//                            if requestSuccess == false {
//                                if msg != nil {
//                                    //请求失败的提示
//                                    self.requestFailAlter(code: code!, msg: msg as! String)
//                                }
//                            }
//                        }
//                    }
//                }else{
//                    //请求后台接口网络请求框架错误
//                    self.NetWorkFaile(error: response.result.error! as NSError)
//                }
//                
//                let data = RequestData(success: requestSuccess,json:requestJson,error:response.result.error as Any,requestURL: requestURL)
//                
//                handler(data)
//                
//            }
//        }else{
//            //网络没有连接
//            
//        }
//        
//    }
//    /**
//     请求失败的提示
//     */
//    func requestFailAlter(code:Int, msg:String) {
//        if code == 595 {
//            let model = LoginModel.init()
//            NSKeyedArchiver.archiveRootObject(model, toFile: UserDataPath)
//            saveDefaults.set("NO", forKey: UserisLogin)
//            RYQAlterVC.initOnlySureAlert(title: "温馨提示", message: msg, sencondTitle: "确定", second: {
//                let app = UIApplication.shared.delegate as! AppDelegate
//                app.changeAppRootVC()
//            }, presentVC: Factory.getCurrentViewController())
//        }else{
//            //提示
//            Factory.alterMessage(message: msg)
//        }
//    }
//    /**
//     请求后台接口网络请求框架错误
//     */
//    func NetWorkFaile(error:NSError) {
//        RYQLog(error)
//        let alert = error.userInfo["NSLocalizedDescription"]!
//        Factory.alterMessage(message: alert as! String)
//    }
}

//
//  NetWorkHelper.swift
//  TableView
//
//  Created by 橘子 on 2018/10/31.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit
import HandyJSON

class NetWorkHelper: NSObject {
    
    static let tool = NetWorkHelper()
    /**
     请求结果
     */
    struct Result {
        var model:Any
        var list:Array<Any>
        var success:Bool
    }
    
    //请求成功后的闭包回调
    typealias successHandler = (Result) -> Void
    //请求失败后的闭包回调
    typealias failHandler = (Any) -> Void
    /**
     请求登录接口
     */
    func loginRequest(param:[String:Any], success:@escaping successHandler, fail:@escaping failHandler) {
//        SXYNetWork.work.PostRequest(url: UserLogin, paramters: param) { (data) in
//            if let loginModel = JSONDeserializer<LoginModel>.deserializeFrom(json: data.json){
//                RYQLog(loginModel.data?.Token)
//                //将用户的基本信息存储到本地
//                NSKeyedArchiver.archiveRootObject(loginModel, toFile: UserDataPath)
//            }
//            let aResult = Result(model: (Any).self, list: [], success:data.success!)
//            self.resultCallBack(success: success, faile: fail, error: data.error, aResult: aResult)
//        }
    }
    
    func resultCallBack(success:@escaping successHandler, faile:@escaping failHandler, error:Any, aResult:Result) {
        if error is NSError {
            faile(error)
        }else{
            success(aResult)
        }
    }
}

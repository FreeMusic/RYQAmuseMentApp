//
//  RYQAlterVC.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/23.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class RYQAlterVC: UIAlertController {
    
    /**
     
     */
    typealias firstClosure = () -> Void

    typealias secondClosure = () -> Void
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    class func initAlert(title:String, message:String, firstTitle:String, cancle:@escaping firstClosure, sencondTitle:String, second:@escaping secondClosure, presentVC:UIViewController) {
        
        let alertVC = RYQAlterVC.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let cancleAction = UIAlertAction.init(title: firstTitle, style: UIAlertAction.Style.cancel) { (action) in
            cancle()
        }
        
        let defaultAction = UIAlertAction.init(title: sencondTitle, style: UIAlertAction.Style.default) { (action) in
            second()
        }
        
        alertVC.addAction(cancleAction)
        alertVC.addAction(defaultAction)
        
        presentVC.present(alertVC, animated: true, completion: nil)
    }
    /**
     只有确定按钮的提示
     */
    class func initOnlySureAlert(title:String, message:String,sencondTitle:String,second:@escaping secondClosure, presentVC:UIViewController) {
        let alertVC = RYQAlterVC.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction.init(title: sencondTitle, style: UIAlertAction.Style.default) { (action) in
            second()
        }
        
        alertVC.addAction(defaultAction)
        presentVC.present(alertVC, animated: true, completion: nil)
    }
}

extension RYQAlterVC {
    /**
     Actionsheet
     */
    class func initActionSheet(title:String, message:String, firstTitle:String, cancle:@escaping firstClosure, sencondTitle:String, second:@escaping secondClosure, presentVC:UIViewController){
        
        let alertController = UIAlertController(title: title, message: message,
                                                preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: firstTitle, style: .default) { (action) in
            cancle()
        }
        let archiveAction = UIAlertAction(title: sencondTitle, style: .default) { (action) in
            second()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.addAction(archiveAction)
        presentVC.present(alertController, animated: true, completion: nil)
    }
}

//
//  MyPublic.swift
//  StarAPP
//
//  Created by 刘园 on 2018/4/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class MyPublic: NSObject {
    
    class func getImgView(_ ImgName: NSString)->UIImage{

        var image = UIImage(named:ImgName as String)
        
        if image == nil {
            image = UIImage.init()
        }
        
        image = image?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        return image!
    }

}

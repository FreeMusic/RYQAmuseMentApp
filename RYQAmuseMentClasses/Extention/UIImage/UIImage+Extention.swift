//
//  UIImage+Extention.swift
//  StarAPP
//
//  Created by 橘子 on 2018/12/26.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation
import UIKit

/**
 图像处理
 */
extension UIImage {
    /**
     将图片截成最大的正方形显示
     */
    func rectAngleChangeToSquare() -> UIImage {
        let imageSize: CGSize = size
        // 中间最大正方形尺寸
        var centerRect = CGRect.zero
        var centerRectWH: CGFloat = 0.0
        //根据图片的大小计算出图片中间矩形区域的位置与大小

        if imageSize.width > imageSize.height {

            centerRectWH = imageSize.height

            let leftMargin = Float((imageSize.width - imageSize.height) * 0.5)

            centerRect = CGRect(x: CGFloat(leftMargin), y: 0, width: centerRectWH, height: centerRectWH)

        } else {

            centerRectWH = imageSize.width

            let topMargin = Float((imageSize.height - imageSize.width) * 0.5)

            centerRect = CGRect(x: 0, y: CGFloat(topMargin), width: centerRectWH, height: centerRectWH)

        }

        let imageRef = cgImage
        //在最大正方形尺寸范围内截取
        let imageRefRect = imageRef?.cropping(to: centerRect)
        var tmp: UIImage? = nil
        tmp = UIImage(cgImage: imageRefRect!)
        
        return tmp!
    }
    
}

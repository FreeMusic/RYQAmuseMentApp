//
//  String+Category.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/9.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation
import UIKit

extension String {
    /**
     * 查询lable高度
     * @param width, lable宽度
     */
    func getLableHeightByWidth(width: CGFloat,
                               lineSpace:CGFloat,
                               font: UIFont) -> CGFloat {
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.lineSpacing = lineSpace
        let attributes = [NSAttributedString.Key.font:font,
                          NSAttributedString.Key.paragraphStyle:paragraphStyle.copy()]
        
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributes, context:nil)
        return rect.size.height
    }
    /**
     * 查询lable宽度
     * @param width, lable宽度
     */
    func getLableWidthByWidth(width: CGFloat,
                               font: UIFont) -> CGFloat {
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        let attributes = [NSAttributedString.Key.font:font,
                          NSAttributedString.Key.paragraphStyle:paragraphStyle.copy()]
        
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributes, context:nil)
        return rect.size.width
    }
    //截取字符串
    func substrfromBegin(length:Int)->String{
        
        let index = self.index(self.startIndex, offsetBy: length)
        
        return self.substring(to: index)
        
    }
}

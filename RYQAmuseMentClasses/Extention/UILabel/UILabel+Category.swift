//
//  UILabel+Category.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation
import UIKit

private var labelActionKey: Void?//可点击标签
private var labelColorKey: Void?//颜色

/**
 label的点击手势事件闭包
 */
typealias labelAction = () -> Void

enum LabelFontStyle {
    case system
    case blod
}

extension UILabel {
    
    var labelColor: UIColor {
        get {
            return (objc_getAssociatedObject(self, &labelColorKey) as! UIColor)
        }
        set (newValue) {
            objc_setAssociatedObject(self, &labelColorKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            self.backgroundColor = newValue.withAlphaComponent(0.3)
            self.textColor = newValue
            self.layer.borderColor = newValue.cgColor
            self.layer.borderWidth = 1
            self.textAlignment = NSTextAlignment.center
            self.layer.cornerRadius = 5*m6Scale
            self.layer.masksToBounds = true
        }
    }
    
    /**
     UILabel  添加分类
     color  字体颜色
     font  字体大小
     text  label字体
     subView 父视图
     */
    convenience init(color: UIColor, font: CGFloat, text: String, subView:UIView){
        self.init()
        self.text = text
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: font*m6Scale)
        subView.addSubview(self)
    }
    class func initLabel (color: UIColor, font: CGFloat, style:LabelFontStyle,text: String, subView:UIView) -> UILabel {
        let label = UILabel.init()
        label.text = text
        label.textColor = color
        subView.addSubview(label)
        
        switch style {
        case .system:
            label.font = UIFont.systemFont(ofSize: font*m6Scale)
        case .blod:
            label.font = UIFont.boldSystemFont(ofSize: font*m6Scale)
        default:
            label.font = UIFont.systemFont(ofSize: font*m6Scale)
        }
        
        return label
    }
    /**
     UILabel  添加分类
     color  字体颜色
     font  字体大小
     text  label字体
     subView 父视图
     action 点击事件
     */
    class func initLabel (color: UIColor, font: CGFloat, text: String, subView:UIView, action:@escaping labelAction) -> UILabel {
        
        let label = UILabel.init()
        
        label.text = text
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: font*m6Scale)
        subView.addSubview(label)
        label.isUserInteractionEnabled = true
        
        
        let tap = UITapGestureRecognizer.init(target: label, action: #selector(labelClick(tap:)))
        label.addGestureRecognizer(tap)
        objc_setAssociatedObject(tap, &labelActionKey, action as Any, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        
        return label
    }
    /**
     改变字符串的颜色
     */
    func changeStringColor(changeString:String, color:UIColor){
        
        let string = NSMutableAttributedString.init(string: self.text!)
        
        string.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSMakeRange(0, changeString.characters.count))
        
        self.attributedText = string
    }
    /**
     改变同一个Label的某些字体大小
     */
    func changeStringSize(changeString:String, font:UIFont) {
        let string = NSMutableAttributedString.init(string: self.text!)
        string.addAttribute(NSAttributedString.Key.font, value: font, range: NSMakeRange(0, changeString.characters.count))
        
        self.attributedText = string
    }
    
    /**
     按钮的点击事件
     */
    @objc func labelClick(tap: UITapGestureRecognizer) -> Void {
        let action = objc_getAssociatedObject(tap, &labelActionKey) as! labelAction
        action()
    }
}
/**
 行间距 字间距 首行缩进等排版问题
 */
extension UILabel {
    /**
     *改变行间距
     */
    func changeLineSpace(space:CGFloat) {
        //通过富文本来设置行间距
        let paraph = NSMutableParagraphStyle()
        //将行间距设置为28
        paraph.lineSpacing = space
        //样式属性集合
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15),
                          NSAttributedString.Key.paragraphStyle: paraph]
        self.attributedText = NSAttributedString(string: self.text!, attributes: attributes)
    }
    /**
     首行缩进两个字符
     */
    func indentationForTheFirstLine() {
        let paraStyle = NSMutableParagraphStyle.init()
        paraStyle.alignment = NSTextAlignment.left//对齐
        paraStyle.headIndent = 2//行首缩进
        //参数：（字体大小17号字乘以2，34f即首行空出两个字符）
        let emptylen = self.font.pointSize*paraStyle.headIndent
        paraStyle.firstLineHeadIndent = emptylen//首行缩进
        paraStyle.tailIndent = 0//行尾缩进
        paraStyle.lineSpacing = 2.0;//行间距
        
        let attrText = NSAttributedString.init(string: self.text!, attributes: [NSAttributedString.Key.paragraphStyle:paraStyle])
        
        self.attributedText = attrText
    }
}

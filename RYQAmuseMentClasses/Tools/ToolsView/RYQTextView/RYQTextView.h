//
//  ZLMTextView.h
//  WinLotteryApp
//
//  Created by 橘子 on 2018/8/10.
//  Copyright © 2018年 橘子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYQTextView : UITextView

/*!
 * @brief 占位符文本,与UITextField的placeholder功能一致
 */
@property (nonatomic, strong) NSString *placeholder;

/*!
 * @brief 占位符文本颜色
 */
@property (nonatomic, strong) UIColor *placeholderTextColor;


@end

//
//  BaseViewController.h
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 返回按钮的点击
 */
- (void)backClick;

//设置状态栏背景颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color;

//打开大标题
- (void)openLargeTitle:(NSString *)title;
/**
 关闭大标题
 */
- (void)closeLargeTitle;

@end

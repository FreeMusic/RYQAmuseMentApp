//
//  BaseViewController.m
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //解决没有导航栏时 坐标从状态栏底部开始的问题
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
//    //隐藏导航栏的分割线
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}
/**
 自定义返回栏
 */
- (void)customBackItem{
    self.navigationController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backBlackIcon"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
}
/**
 返回按钮的点击
 */
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

//结束输入
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
//    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
//}
//设置状态栏背景颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
}

/**
 开启大标题
 */
- (void)openLargeTitle:(NSString *)title{
    if (@available(iOS 11.0, *)) {
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
        self.navigationController.navigationBar.prefersLargeTitles = YES;
        self.navigationItem.hidesSearchBarWhenScrolling = YES;
        self.navigationItem.title = title;
    } else {
        self.title = title;
    }
}

/**
 关闭大标题
 */
- (void)closeLargeTitle{
    if (@available(iOS 11.0, *)) {
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
        self.navigationController.navigationBar.prefersLargeTitles = NO;
        self.navigationItem.hidesSearchBarWhenScrolling = YES;
    } else {
        
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
}

@end

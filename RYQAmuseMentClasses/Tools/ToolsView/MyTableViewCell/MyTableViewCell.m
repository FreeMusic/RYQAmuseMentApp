//
//  MyTableViewCell.m
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell (){
    UIBezierPath *path;//路径
    CAShapeLayer *layer;///layer单线
}

@end

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //路径
        path = [UIBezierPath bezierPath];
        ///layer单线
        layer = [CAShapeLayer layer];
        layer.strokeColor = [UIColor grayColor].CGColor;
        layer.lineWidth = 1;
    }
    
    return self;
}

/**
 backView
 */
- (UIView *)backView{
    if(!_backView){
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.cornerRadius = 4;
        _backView.layer.masksToBounds = YES;
        [self addSubview:_backView];
    }
    return _backView;
}

//- (void)setStyle:(MyTableViewCellStyle)style {
//    EBLog(@"self.frame   ****   %f", self.frame.size.height);
//    switch (style) {
//        case MyTableViewCellNoneStyle:{
//            layer.strokeColor = [UIColor clearColor].CGColor;
//        }
//            break;
//        case MyTableViewCellSignleLineStyle:{
//            layer.strokeColor = [UIColor grayColor].CGColor;
//        }
//            break;
//
//        default:
//            break;
//    }
//    [path moveToPoint:CGPointMake(20, self.frame.size.height-1)];
//    [path addLineToPoint:CGPointMake(self.frame.size.width-20, self.frame.size.height-1)];
//    layer.path = path.CGPath;
//    [self.layer addSublayer:layer];
//}

@end

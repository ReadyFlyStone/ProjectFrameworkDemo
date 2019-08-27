//
//  QMUICommonViewController+AddNavBarItem.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/31.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import "QMUICommonViewController+AddNavBarItem.h"

@implementation QMUICommonViewController (AddNavBarItem)

//配置左边的样式
-(void)setNavLeftModel:(BaseViewNavStyleLeft)customNavStyle{
    // 下面判断考虑到，如果有继承关系用到这个配置，先把第一次的置空 再重新定义
//    UIButton *buttonleft;
//    if (nil != buttonleft) {
//        buttonleft.hidden = YES;
//        buttonleft = nil;
//    }
//
//    buttonleft = [UIButton buttonWithType:UIButtonTypeCustom];
//    buttonleft.alpha = 0.7;
//    [buttonleft setExclusiveTouch:YES];
//    [buttonleft setShowsTouchWhenHighlighted:YES];
    UIButton *buttonleft = [self createBtnWithLeft:YES];
    [buttonleft setFrame:CGRectMake(0, 0, 44, 44)];
    [buttonleft addTarget:self action:@selector(goBackNav:) forControlEvents:UIControlEventTouchUpInside];
    if (customNavStyle == BaseViewNavStyleLeftBack) {
        [buttonleft setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    }
    [buttonleft sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonleft];
}

//配置右边的样式
-(void)setNavRightMoreModel:(BaseViewNavStyleRight)customNavStyle{
    // 下面判断考虑到，如果有继承关系用到这个配置，先把第一次的置空 再重新定义
//    UIButton *buttonRight;
//    if (nil != buttonRight) {
//        buttonRight.hidden = YES;
//        buttonRight = nil;
//    }
//    buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
//    buttonRight.alpha = 0.7;
//    [buttonRight setExclusiveTouch:YES];
//    [buttonRight setShowsTouchWhenHighlighted:YES];
//    [buttonRight setFrame:CGRectMake(0, 0, 44, 44)];
//    [buttonRight addTarget:self action:@selector(toPushNav:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *buttonRight = [self createBtnWithLeft:NO];
    if (customNavStyle == BaseViewNavStyleRightShare) {
        [buttonRight setTitle:@"分享" forState:UIControlStateNormal];
    } else if (customNavStyle == BaseViewNavStyleRightSearch) {
        [buttonRight setImage:[UIImage imageNamed:@"SearchImage"] forState:UIControlStateNormal];
    }
    [buttonRight sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonRight];
}

- (UIButton *)createBtnWithLeft:(BOOL)isLeft {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.alpha = 0.7;
//    [buttonRight setExclusiveTouch:YES];
//    [buttonRight setShowsTouchWhenHighlighted:YES];
    [btn setFrame:CGRectMake(0, 0, 44, 44)];
    SEL sel;
    if (isLeft) {
        sel = @selector(goBackNav:);
    } else {
        sel = @selector(toPushNav:);
    }
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

#pragma mark - 点击nav Button 事件处理 -
-(void)goBackNav:(UIButton *)sender {
    
}

-(void)toPushNav:(UIButton *)sender {
    
}

- (void)getData {

}

@end

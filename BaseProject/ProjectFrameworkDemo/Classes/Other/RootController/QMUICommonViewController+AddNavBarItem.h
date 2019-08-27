//
//  QMUICommonViewController+AddNavBarItem.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/31.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import "QMUICommonViewController.h"

typedef NS_ENUM(NSUInteger,BaseViewNavStyleLeft){
    BaseViewNavStyleLeftBack,
    BaseViewNavStyleLeftMenu,
};

typedef NS_ENUM(NSUInteger,BaseViewNavStyleRight){
    BaseViewNavStyleRightShare,
    BaseViewNavStyleRightSearch,
};

NS_ASSUME_NONNULL_BEGIN

@interface QMUICommonViewController (AddNavBarItem)

// 左右Button点击的事件
-(void)goBackNav:(UIButton *)sender;
-(void)toPushNav:(UIButton *)sender;

//配置左边的样式
-(void)setNavLeftModel:(BaseViewNavStyleLeft)customNavStyle;

//配置右边的样式
-(void)setNavRightMoreModel:(BaseViewNavStyleRight)customNavStyle;

- (void)getData;

@end

NS_ASSUME_NONNULL_END

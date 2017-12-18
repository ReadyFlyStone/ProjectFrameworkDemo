//
//  RootViewController.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 16/6/8.
//  Copyright © 2016年 xiaopao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,BaseViewNavStyleLeft){
    BaseViewNavStyleLeftBack,
    BaseViewNavStyleLeftMenu,
};

typedef NS_ENUM(NSUInteger,BaseViewNavStyleRight){
    BaseViewNavStyleRightShare,
    BaseViewNavStyleRightSearch,
};

@interface RootViewController : UIViewController

// 左右Button点击的事件
-(void)goBackNav:(UIButton *)sender;
-(void)toPushNav:(UIButton *)sender;

//配置左边的样式
-(void)setNavLeftModel:(BaseViewNavStyleLeft)customNavStyle;

//配置右边的样式
-(void)setNavRightMoreModel:(BaseViewNavStyleRight)customNavStyle;

- (instancetype)initWithTitle:(NSString *)title withNormalImage:(NSString *)image withSelectedImage:(NSString *)selectedImage;

- (void)getData;

@end

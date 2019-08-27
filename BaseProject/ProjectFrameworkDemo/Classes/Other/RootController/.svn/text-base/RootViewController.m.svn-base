//
//  RootViewController.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 16/6/8.
//  Copyright © 2016年 xiaopao. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (instancetype)initWithTitle:(NSString *)title withNormalImage:(NSString *)image withSelectedImage:(NSString *)selectedImage
{
    self = [super init];
    if (self) {
        self.title = title;
        self.tabBarItem.image = [UIImage imageNamed:image];
        self.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

//配置左边的样式
-(void)setNavLeftModel:(BaseViewNavStyleLeft)customNavStyle{
    // 下面判断考虑到，如果有继承关系用到这个配置，先把第一次的置空 再重新定义
    UIButton *buttonleft;
    if (nil != buttonleft) {
        buttonleft.hidden = YES;
        buttonleft = nil;
    }
    
    buttonleft = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonleft.alpha = 0.7;
//    [buttonleft setExclusiveTouch:YES];
//    [buttonleft setShowsTouchWhenHighlighted:YES];
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
    UIButton *buttonRight;
    if (nil != buttonRight) {
        buttonRight.hidden = YES;
        buttonRight = nil;
    }
    buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonRight.alpha = 0.7;
    [buttonRight setExclusiveTouch:YES];
    [buttonRight setShowsTouchWhenHighlighted:YES];
    [buttonRight setFrame:CGRectMake(0, 0, 44, 44)];
    [buttonRight addTarget:self action:@selector(toPushNav:) forControlEvents:UIControlEventTouchUpInside];
    if (customNavStyle == BaseViewNavStyleRightShare) {
        [buttonRight setTitle:@"分享" forState:UIControlStateNormal];
    } else if (customNavStyle == BaseViewNavStyleRightSearch) {
        [buttonRight setImage:[UIImage imageNamed:@"SearchImage"] forState:UIControlStateNormal];
    }
    [buttonRight sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonRight];
}

#pragma mark - 点击nav Button 事件处理 -
-(void)goBackNav:(UIButton *)sender {
    
}

-(void)toPushNav:(UIButton *)sender {
    
}

- (void)getData {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

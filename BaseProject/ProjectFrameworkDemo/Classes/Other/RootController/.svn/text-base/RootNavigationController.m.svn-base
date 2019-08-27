//
//  RootNavigationController.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 16/6/8.
//  Copyright © 2016年 xiaopao. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

+ (void)initialize
{
    if (self == [RootNavigationController class]) {
        
        // 设置整个项目中的导航栏item属性
        UIBarButtonItem *item = [UIBarButtonItem appearance];
        
        // 设置普通状态
        NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        [item setTitleTextAttributes:textAttrs forState:(UIControlStateNormal)];
        
        // 不可用状态
        NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
        disableTextAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        [item setTitleTextAttributes:disableTextAttrs forState:(UIControlStateDisabled)];
        
        // 设置导航栏不透明
        [UINavigationBar appearance].translucent = NO;
        
        // 设置导航栏标题为白色
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowColor = [UIColor whiteColor];
        shadow.shadowOffset = CGSizeMake(0, 0);
        [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGBColor(255, 255, 255), NSForegroundColorAttributeName, shadow, NSShadowAttributeName, [UIFont systemFontOfSize:17], NSFontAttributeName, nil]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setBarTintColor:Main_Color];
    // 设置系统item为白色
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:RGBColorAlpha(20.0, 20.0, 20.0, 0.9)];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

// 设置状态栏字体为白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  AppDelegate+AppService.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 16/6/12.
//  Copyright © 2016年 xiaopao. All rights reserved.
//

#import "AppDelegate+AppService.h"

#import "DWScrollPictures.h"
#import "FirstStartVC.h"

@implementation AppDelegate (AppService)

#pragma mark -键盘管理
- (void)setKeyboardManager {
    IQKeyboardManager *mgr = [IQKeyboardManager sharedManager];
    mgr.enable = YES;
    mgr.shouldResignOnTouchOutside = YES;
    mgr.shouldShowTextFieldPlaceholder = NO;
    mgr.enableAutoToolbar = YES;
}

#pragma mark -设置svp
-(void)setSVProgressHUD {
    //设置最小消失时间
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
}

- (void)chooseVCToPush {
    if (!GVUserDefault.isFirst) {
        // 第一次登陆
        [self pushToFirstVC];
        GVUserDefault.isFirst = YES;
    }
//    else if ([self isNeedLogin]) {
//        // 判断是不是需要重新登录
//        [self pushToMainVc];
//    }
    else {
        // 进入登陆界面
        [self pushToLoginVc];
    }
}

// 判断是否需要重新登录
- (BOOL)isNeedLogin {
    if (GVUserDefault.isAutoLogin) {
        return NO;
    }
    
    return YES;
//    // 获取到过期的日期
//    NSDate *date = [XPUserDefault valueForKey:@"date"];
//    // 获取当前的日期(已转换东八区)
//    NSDate *now_date = [NSDate date];
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate: date];
//    NSDate *localeDate = [now_date dateByAddingTimeInterval: interval];
//    // 比较两个日期 (后面时间大于当前时间 Yes)
//    BOOL isNeed = [localeDate compare:date] == NSOrderedAscending;
//    
//    return isNeed;
}

// 执行首次启动页面
- (void)pushToFirstVC {
    [DWScrollPictures dw_AppdelegateNewFeaturesWindow:self.window newFeaturesVC:[[FirstStartVC alloc] init] mainVC:[[RootTabBarController alloc] init]];
}

- (void)pushToMainVc {
    RootTabBarController *tabbarVC = [[RootTabBarController alloc] init];
    
    self.window.rootViewController = tabbarVC;
}

- (void)pushToLoginVc {
    XPLoginVC *loginVC = [[XPLoginVC alloc] init];
    RootNavigationController *nav = [[RootNavigationController alloc] initWithRootViewController:loginVC];
    
    self.window.rootViewController = nav;
}


@end

//
//  AppDelegate.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 16/6/8.
//  Copyright © 2016年 xiaopao. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+AppService.h"
#import "AppDelegate+UShare.h"
#import "FWTestVC.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化window
    [self initWindow];
    
    //初始化app服务
    [self initService];
    
    //初始化IM
    [[FWIMManager shared] initIM];
    
    //初始化用户系统
    [self initUserManager];
//    [self pushToTestVC];
    
    //网络监听
    [self monitorNetworkStatus];
    
    [self setKeyboardManager];
    [self setSVProgressHUD];
    
    [WXApi registerApp:kAppKey_Wechat];
    [self UShareConfig];
  
    //c侧滑返回
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:(MLTransitionGestureRecognizerTypeScreenEdgePan)];
    
    return YES;
}

- (void)pushToTestVC {
    FWTestVC *testVC = [[FWTestVC alloc] init];
    RootNavigationController *nav = [[RootNavigationController alloc] initWithRootViewController:testVC];
    
    self.window.rootViewController = nav;
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED > 100000
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url options:options];
    if (!result) {
        return [self judgePayResultWithURL:url];
    }
    return result;
}
#endif

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        return [self judgePayResultWithURL:url];
    }
    return result;
}

- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url {
    
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        return [self judgePayResultWithURL:url];
    }
    return result;
}

- (BOOL)judgePayResultWithURL:(NSURL *)url {
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AWApiManager sharedManager] AlipayManagerWithURL:url];
        return YES;
    }
    return [WXApi handleOpenURL:url delegate:[AWApiManager sharedManager]];
}

@end

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
#import "AppManager.h"

@implementation AppDelegate (AppService)

#pragma mark ————— 初始化服务 —————
- (void)initService{
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:KNotificationLoginStateChange
                                               object:nil];
    
    //网络状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(netWorkStateChange:)
                                                 name:KNotificationNetWorkStateChange
                                               object:nil];
}

#pragma mark ————— 初始化window —————
- (void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [[UIButton appearance] setExclusiveTouch:YES];
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
}

+ (AppDelegate *)shareAppDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#pragma mark -键盘管理
- (void)setKeyboardManager {
    IQKeyboardManager *mgr = [IQKeyboardManager sharedManager];
    mgr.enable = YES;
    mgr.shouldResignOnTouchOutside = YES;
    mgr.shouldShowToolbarPlaceholder = NO;
    mgr.enableAutoToolbar = YES;
}

#pragma mark -设置svp
-(void)setSVProgressHUD {
    //设置最小消失时间
    [SVProgressHUD setMinimumDismissTimeInterval:0.5];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
}

// 执行首次启动页面
- (void)pushToFirstVC {
    RootTabBarController *tabBarController = [[RootTabBarController alloc] init];
    
    [DWScrollPictures dw_AppdelegateNewFeaturesWindow:self.window newFeaturesVC:[[FirstStartVC alloc] init] mainVC:tabBarController];
}

- (void)pushToMainVC {
    RootTabBarController *tabBarController = [[RootTabBarController alloc] init];
    self.mainTabBar = tabBarController;
    [tabBarController hideTabBadgeBackgroundSeparator];
    self.window.rootViewController = tabBarController;
}

- (void)pushToLoginVC {
    FWLoginVC *loginVC = [[FWLoginVC alloc] init];
    RootNavigationController *nav = [[RootNavigationController alloc] initWithRootViewController:loginVC];
    
    self.window.rootViewController = nav;
}

#pragma mark ————— 初始化用户系统 —————
-(void)initUserManager{
    if (!GVUserDefault.isFirst) {
        // 第一次登陆
        [self pushToFirstVC];
        GVUserDefault.isFirst = YES;
    } else {
        //如果有本地数据，先展示TabBar 随后异步自动登录
        [self pushToMainVC];
        
        if([userManager loadUserInfo]) {
            //自动登录
            [userManager autoLoginToServer:^(BOOL success, NSString *des) {
                if (success) {
                    XPLog(@"自动登录成功");
                    [SVProgressHUD showSuccessWithStatus:@"自动登录成功"];
                    KPostNotification(KNotificationAutoLoginSuccess, nil);
                }else{
                    [SVProgressHUD showErrorWithStatus:NSStringFormat(@"自动登录失败：%@",des)];
                }
            }];
        } else {
            //没有登录过，展示登录页面
//            KPostNotification(KNotificationLoginStateChange, @NO)
//            [SVProgressHUD showErrorWithStatus:@"需要登录"];
        }
    }
    
    //广告页
    [AppManager appStart];
    [AppManager showFPS];
}

#pragma mark ————— 登录状态处理 —————
- (void)loginStateChange:(NSNotification *)notification {
    BOOL loginSuccess = [notification.object boolValue];
    
    if (loginSuccess) {//登陆成功加载主窗口控制器
        //为避免自动登录成功刷新tabbar
        if (!self.mainTabBar || ![self.window.rootViewController isKindOfClass:[CYLTabBarController class]]) {
            [self pushToMainVC];
        }
    }else {//登陆失败加载登陆页面控制器
        self.mainTabBar = nil;
        [self pushToLoginVC];
    }
}

#pragma mark ————— 网络状态变化 —————
- (void)netWorkStateChange:(NSNotification *)notification {
    BOOL isNetWork = [notification.object boolValue];
    
    if (isNetWork) {//有网络
        if ([userManager loadUserInfo] && !isLogin) {//有用户数据 并且 未登录成功 重新来一次自动登录
            [userManager autoLoginToServer:^(BOOL success, NSString *des) {
                if (success) {
                    XPLog(@"网络改变后，自动登录成功");
                    KPostNotification(KNotificationAutoLoginSuccess, nil);
                }else{
                    [SVProgressHUD showErrorWithStatus:NSStringFormat(@"自动登录失败：%@",des)];
                }
            }];
        }
    }else {//登陆失败加载登陆页面控制器
        [SVProgressHUD showInfoWithStatus:@"网络状态不佳"];
    }
}

#pragma mark ————— 网络状态监听 —————
- (void)monitorNetworkStatus {
    // 网络状态改变一次, networkStatusWithBlock就会响应一次
    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatusType networkStatus) {
        switch (networkStatus) {
                // 未知网络
            case PPNetworkStatusUnknown:
                XPLog(@"网络环境：未知网络");
                // 无网络
            case PPNetworkStatusNotReachable:
                XPLog(@"网络环境：无网络");
                KPostNotification(KNotificationNetWorkStateChange, @NO);
                break;
                // 手机网络
            case PPNetworkStatusReachableViaWWAN:
                XPLog(@"网络环境：手机自带网络");
                // 无线网络
            case PPNetworkStatusReachableViaWiFi:
                XPLog(@"网络环境：WiFi");
                KPostNotification(KNotificationNetWorkStateChange, @YES);
                break;
        }
    }];
}

@end

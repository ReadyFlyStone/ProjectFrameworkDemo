//
//  AppDelegate+AppService.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 16/6/12.
//  Copyright © 2016年 xiaopao. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)

//初始化服务
-(void)initService;

//初始化 window
-(void)initWindow;

//单例
+ (AppDelegate *)shareAppDelegate;

//初始化用户系统
-(void)initUserManager;

//监听网络状态
- (void)monitorNetworkStatus;

// 键盘管理
- (void)setKeyboardManager;
// 弹框提示管理
- (void)setSVProgressHUD;

// 跳转到主界面
- (void)pushToMainVC;
// 跳转到登录界面
- (void)pushToLoginVC;

@end

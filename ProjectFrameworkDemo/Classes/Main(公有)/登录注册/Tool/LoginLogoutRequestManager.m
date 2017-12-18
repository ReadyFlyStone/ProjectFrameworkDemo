//
//  LoginLogoutRequestManager.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/20.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "LoginLogoutRequestManager.h"

#import "LoginModel.h"

@implementation LoginLogoutRequestManager
HDSingletonM(Manager)

- (void)getLoginDataWithMobile:(NSString *)mobile Password:(NSString *)password IsAutoLogin:(BOOL)isAutoLogin Success:(Successs)success Failure:(Failure)failure {
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"mobile"] = mobile;
    params[@"password"] = password;
    
    //    请求数据
    [httpTool POST:loginURL parameters:params success:^(id  _Nonnull responseObject) {
        
        GVUserDefault.isLogin = YES;
        GVUserDefault.isAutoLogin = isAutoLogin;
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

- (void)getLogoutDataSuccess:(Successs)success Failure:(Failure)failure {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    //    请求数据
    [httpTool POST:logoutURL parameters:params success:^(id  _Nonnull responseObject) {
        
        GVUserDefault.isLogin = NO;
        GVUserDefault.isAutoLogin = NO;
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

@end

//
//  LoginLogoutRequestManager.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/20.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

typedef void (^ _Nullable Successs)(id _Nullable responseObject);     // 成功Block
typedef void (^ _Nullable Failure)(NSError * _Nullable error);        // 失败Blcok

@interface LoginLogoutRequestManager : NSObject
HDSingletonH(Manager) // 单例声明

- (void)getLoginDataWithMobile:(NSString *_Nullable)mobile Password:(NSString *_Nullable)password IsAutoLogin:(BOOL)isAutoLogin Success:(Successs)success Failure:(Failure)failure;

- (void)getLogoutDataSuccess:(Successs)success Failure:(Failure)failure;

@end
NS_ASSUME_NONNULL_END

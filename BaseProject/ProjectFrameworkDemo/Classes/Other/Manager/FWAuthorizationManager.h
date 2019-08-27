//
//  FWAuthorizationManager.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/19.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FWAuthorizationManagerStatus) {
    AuthorizationStatusAuthorized = 0,    // 已授权
    AuthorizationStatusDenied,            // 拒绝
    AuthorizationStatusRestricted,        // 应用没有相关权限，且当前用户无法改变这个权限，比如:家长控制
    AuthorizationStatusNotSupport         // 硬件等不支持
};

NS_ASSUME_NONNULL_BEGIN

@interface FWAuthorizationManager : NSObject

+ (void)requestImagePickerAuthorization:(void(^)(FWAuthorizationManagerStatus status))callback;
+ (void)requestCameraAuthorization:(void(^)(FWAuthorizationManagerStatus status))callback;
+ (void)requestAddressBookAuthorization:(void (^)(FWAuthorizationManagerStatus))callback;

@end

NS_ASSUME_NONNULL_END

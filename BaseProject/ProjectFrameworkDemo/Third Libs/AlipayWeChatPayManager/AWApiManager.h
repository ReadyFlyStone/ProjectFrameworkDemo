//
//  AWApiManager.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/28.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"

@protocol WXApiManagerDelegate <NSObject>

@optional

- (void)managerDidRecvGetSuccessReq;

- (void)managerDidRecvGetfailureReq;

@end

@interface AWApiManager : NSObject <WXApiDelegate>

@property (nonatomic, assign) id<WXApiManagerDelegate> delegate;

+ (instancetype)sharedManager;

- (void)AlipayManagerWithURL:(NSURL *)url;

/**
 支付宝支付调用接口

 @param orderStr 后台返回订单字符串
 */
- (void)alipayDidPayOrder:(NSString *)orderStr;

/**
 微信支付调用接口
 
 @param orderStr 后台返回订单字符串
 */
- (void)weChatDidPayOrder:(NSString *)orderStr;

@end

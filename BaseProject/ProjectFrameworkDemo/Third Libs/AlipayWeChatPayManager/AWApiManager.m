//
//  AWApiManager.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/28.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "AWApiManager.h"
#import "WXApiObject.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>
#import "FWWeChatModel.h"

@implementation AWApiManager

#pragma mark - LifeCycle
+(instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static AWApiManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[AWApiManager alloc] init];
    });
    return instance;
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp {
    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        switch (resp.errCode) {
            case WXSuccess:
            {
                XPLog(@"支付成功－PaySuccess，retcode = %d", resp.errCode);
                if (_delegate
                    && [_delegate respondsToSelector:@selector(managerDidRecvGetSuccessReq)]) {
                    [_delegate managerDidRecvGetSuccessReq];
                }
            }
                break;
            default:
                XPLog(@"错误，retcode = %d, retstr = %@", resp.errCode,resp.errStr);
                if (_delegate
                    && [_delegate respondsToSelector:@selector(managerDidRecvGetfailureReq)]) {
                    [_delegate managerDidRecvGetfailureReq];
                }
                break;
        }
    }
}

- (void)AlipayManagerWithURL:(NSURL *)url {
    [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
        XPLog(@"result4 = %@",resultDic);
        int statusNum = [resultDic[@"resultStatus"] intValue];
        [self aliPayActionWith:statusNum];
    }];
}

// 支付宝支付调用接口
- (void)alipayDidPayOrder:(NSString *)orderStr {
    // 支付宝
    //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
    NSString *appScheme = @"WJPay";
    // NOTE: 调用支付结果开始支付
    [[AlipaySDK defaultService] payOrder:orderStr fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        XPLog(@"reslut = %@",resultDic);
        int statusNum = [resultDic[@"resultStatus"] intValue];
        
        [self aliPayActionWith:statusNum];
    }];
}

// 微信支付调用接口
- (void)weChatDidPayOrder:(NSString *)orderStr {
    // 微信
    FWWeChatModel *weChatModel = [FWWeChatModel modelWithJSON:orderStr];
    //发起请求
    PayReq *req   = [[PayReq alloc]init];
    req.partnerId = weChatModel.partnerid;
    req.package   = weChatModel.package;
    req.timeStamp = weChatModel.timestamp.intValue;
    req.nonceStr  = weChatModel.noncestr;
    req.sign      = weChatModel.sign;
    req.prepayId  = weChatModel.prepayid;
    
    [WXApi sendReq:req];
}

/**
 *  支付宝支付回调
 */
//9000 订单支付成功
//8000 正在处理中
//4000 订单支付失败
//6001 用户中途取消
//6002 网络连接出错
- (void)aliPayActionWith:(int)statusNum {
    if (statusNum == 9000) {
        //支付成功
        if (_delegate
            && [_delegate respondsToSelector:@selector(managerDidRecvGetSuccessReq)]) {
            [_delegate managerDidRecvGetSuccessReq];
        }
    } else if (statusNum == 4000 || statusNum == 6001 || statusNum == 6002) {
        if (_delegate
            && [_delegate respondsToSelector:@selector(managerDidRecvGetfailureReq)]) {
            [_delegate managerDidRecvGetfailureReq];
        }
    }
}

- (void)dealloc {
    self.delegate = nil;
}

@end

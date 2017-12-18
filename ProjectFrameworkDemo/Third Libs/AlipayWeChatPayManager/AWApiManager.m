//
//  AWApiManager.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/28.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "AWApiManager.h"
#import <AlipaySDK/AlipaySDK.h>

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

- (void)dealloc {
    self.delegate = nil;
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp {
    if([resp isKindOfClass:[PayResp class]]){
//支付返回结果，实际支付结果需要去微信服务器端查询
//        NSString *strMsg,*strTitle = [NSString stringWithFormat:@"支付结果"];
        
        switch (resp.errCode) {
            case WXSuccess:
            {
//                strMsg = @"支付结果：成功！";
//                NSLog(@"支付成功－PaySuccess，retcode = %d", resp.errCode);
                if (_delegate
                    && [_delegate respondsToSelector:@selector(managerDidRecvGetSuccessReq)]) {
                    [_delegate managerDidRecvGetSuccessReq];
                }
            }
                break;
                
            default:
//                strMsg = [NSString stringWithFormat:@"支付结果：失败！"];
//                NSLog(@"错误，retcode = %d, retstr = %@", resp.errCode,resp.errStr);
                if (_delegate
                    && [_delegate respondsToSelector:@selector(managerDidRecvGetfailureReq)]) {
                    [_delegate managerDidRecvGetfailureReq];
                }
                break;
        }
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
    }
}


- (void)AlipayManagerWithURL:(NSURL *)url {
    [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
        NSLog(@"result4 = %@",resultDic);
        int statusNum = [resultDic[@"resultStatus"] intValue];
        [self aliPayActionWith:statusNum];
    }];
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
//        NSString *strMsg,*strTitle = [NSString stringWithFormat:@"支付结果"];
//        switch (statusNum) {
//            case 4000:
//                strMsg = @"支付失败";
//                break;
//            case 6001:
//                strMsg = @"支付取消";
//                break;
//            case 6002:
//                strMsg = @"网络连接出错";
//                break;
//            default:
//                break;
//        }
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
        if (_delegate
            && [_delegate respondsToSelector:@selector(managerDidRecvGetfailureReq)]) {
            [_delegate managerDidRecvGetfailureReq];
        }
    }
}

@end

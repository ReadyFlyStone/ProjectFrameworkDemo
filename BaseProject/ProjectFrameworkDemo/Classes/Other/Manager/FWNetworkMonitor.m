//
//  NetworkMonitor.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/18.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import "FWNetworkMonitor.h"

@implementation FWNetworkMonitor

static FWNetworkMonitor *instance = nil;
+ (FWNetworkMonitor *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FWNetworkMonitor alloc] init];
    });
    return instance;
}

- (void)startMonitor {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                XPLog(@"WiFi网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                XPLog(@"蜂窝网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                XPLog(@"您的网络已经断开");
                [SVProgressHUD showInfoWithStatus:@"当前网络已断开, 请检查网络设置 !"];
                break;
            case AFNetworkReachabilityStatusUnknown:
                XPLog(@"未知网络");
                [SVProgressHUD showInfoWithStatus:@"未知网络 !"];
                break;                
            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)stopMonitor {
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

@end

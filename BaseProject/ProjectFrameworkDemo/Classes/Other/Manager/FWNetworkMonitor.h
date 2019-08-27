//
//  NetworkMonitor.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/18.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FWNetworkMonitor : NSObject

+ (FWNetworkMonitor *)sharedInstance;

- (void)startMonitor;

- (void)stopMonitor;

@end

NS_ASSUME_NONNULL_END

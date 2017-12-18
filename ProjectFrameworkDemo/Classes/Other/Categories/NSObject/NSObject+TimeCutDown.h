//
//  NSObject+TimeCutDown.h
//  WanJia
//
//  Created by 周磊 on 2017/4/11.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TimeComeBlock)();

@interface NSObject (TimeCutDown)

+ (void)timeCutDownWithTime:(NSInteger)timeout WithTimeComeBlock:(TimeComeBlock)timeCome;

@end

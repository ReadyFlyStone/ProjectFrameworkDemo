//
//  NSObject+TimeCutDown.m
//  WanJia
//
//  Created by 周磊 on 2017/4/11.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "NSObject+TimeCutDown.h"

@implementation NSObject (TimeCutDown)

+ (void)timeCutDownWithTime:(NSInteger)timeout WithTimeComeBlock:(TimeComeBlock)timeCome{
    __block NSInteger timeOut=timeout * 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //进行结束后的操作
                timeCome();
            });
        } else {
//            int seconds = timeOut % 60;
//            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //正在倒计时中
//                NSLog(@"____%@",strTime);
            });
            timeOut--;
        }
    });
    
    dispatch_resume(_timer);
}

@end

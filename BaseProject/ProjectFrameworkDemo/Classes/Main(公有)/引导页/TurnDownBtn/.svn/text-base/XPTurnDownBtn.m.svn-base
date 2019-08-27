//
//  XPTurnDownBtn.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/12/19.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "XPTurnDownBtn.h"

static NSInteger const showTime = 5;
@implementation XPTurnDownBtn

+ (instancetype)initWithFrame:(CGRect)frame {
    XPTurnDownBtn *button = [XPTurnDownBtn buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:[NSString stringWithFormat:@"跳过%d",(int)showTime] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:38 /255.0 green:38 /255.0 blue:38 /255.0 alpha:0.6];
    button.layer.cornerRadius = 4;
    [[button rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [button dismiss];
    }];
    
    return button;
}

// GCD倒计时
- (void)startCoundown {
    __block int timeout = showTime + 1; //倒计时时间 + 1
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"跳过%d",timeout] forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (void)dismiss {
    if (self.turnDownBlock) {
        self.turnDownBlock();
    }
}

@end

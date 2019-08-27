//
//  UIControl+recurClick.m
//  主要解决按钮的重复点击问题
//
//  Created by King on 16/9/2.
//  Copyright © 2016年 King. All rights reserved.
//

#import "UIControl+recurClick.h"
#import <objc/runtime.h>

@implementation UIControl (recurClick)

- (NSTimeInterval)xp_acceptEventInterval {
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setXp_acceptEventInterval:(NSTimeInterval)xp_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(xp_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load {
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__xp_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)__xp_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (self.xp_ignoreEvent) return;
    if (self.xp_acceptEventInterval > 0)
    {
        self.xp_ignoreEvent = YES;
        
        [self performSelector:@selector(ksksk) withObject:@(NO) afterDelay:self.xp_acceptEventInterval];
    }
    [self __xp_sendAction:action to:target forEvent:event];
}

- (void)ksksk {
    self.xp_ignoreEvent = NO;
}

- (void)setXp_ignoreEvent:(BOOL)xp_ignoreEvent {
    objc_setAssociatedObject(self, BandNameKey, [NSNumber numberWithBool:xp_ignoreEvent], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)xp_ignoreEvent {
    return [objc_getAssociatedObject(self, BandNameKey) boolValue];
}

@end

//
//  GVUserDefaults+UserInfo.m
//  WanJia
//
//  Created by 周磊 on 17/2/28.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "GVUserDefaults+UserInfo.h"

@implementation GVUserDefaults (UserInfo)

@dynamic isLogin;
@dynamic isAutoLogin;
@dynamic isFirst;


//- (NSDictionary *)setupDefaults {
//    return @{
//             @"isLogin"     : @NO,
//             @"isAutoLogin" : @NO,
//             @"isFirst"     : @NO,
//             };
//}

- (NSString *)transformKey:(NSString *)key {
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[key substringToIndex:1] uppercaseString]];
    return [NSString stringWithFormat:@"NSUserDefault%@", key];
}

@end

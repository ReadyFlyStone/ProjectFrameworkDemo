//
//  FWThirdLoginManager.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/22.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import "FWThirdLoginManager.h"

@implementation FWThirdLoginManager

+ (instancetype)shared {
    static FWThirdLoginManager *thirdLoginManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thirdLoginManager = [[FWThirdLoginManager alloc] init];
    });
    return thirdLoginManager;
}

- (void)authForPlatform:(UMSocialPlatformType)platformType completion:(nonnull Completion)completion {
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            if (completion) {
                completion(nil, error);
            }
        } else {
            UMSocialUserInfoResponse *userInfoResp = result;
            if (completion) {
                completion(userInfoResp, error);
            }
        }
    }];
}

@end

//
//  FWThirdLoginManager.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/22.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMShare/UMShare.h>

typedef void(^Completion)(UMSocialUserInfoResponse *, NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface FWThirdLoginManager : NSObject

+ (instancetype)shared;

- (void)authForPlatform:(UMSocialPlatformType)platformType completion:(Completion)completion;

@end

NS_ASSUME_NONNULL_END

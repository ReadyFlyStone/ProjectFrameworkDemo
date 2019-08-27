//
//  NSObject+ThirdLogin.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/28.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "NSObject+ThirdLogin.h"

@implementation NSObject (ThirdLogin)

- (void)authForPlatform:(UMSocialPlatformType)platformType Success:(Success)success {

    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:nil completion:^(id result, NSError *error) {
        
        NSString *message = nil;
        
        if (error) {
            message = @"Get info fail";
            UMSocialLogInfo(@"Get info fail with error %@",error);
        } else {
            
            if ([result isKindOfClass:[UMSocialResponse class]]) {
                UMSocialResponse *resp = result;
                
                UMSocialUserInfoResponse *userInfoResp = [[UMSocialUserInfoResponse alloc] init];
                userInfoResp.uid = resp.uid;
                userInfoResp.unionId = resp.unionId;
                userInfoResp.usid = resp.usid;
                userInfoResp.openid = resp.openid;
                userInfoResp.accessToken = resp.accessToken;
                userInfoResp.refreshToken = resp.refreshToken;
                userInfoResp.expiration = resp.expiration;
                
                if (success) {
                    success(userInfoResp);
                }
//                UMSocialLogInfo(@"Get info success %@", userInfoResp);
            }else{
                message = @"Get info fail";
                UMSocialLogInfo(@"Get info fail with  unknow error");
            }
        }
        if (message) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Auth info"
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"sure", @"确定")
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }];
}

@end

//
//  FWUserManager.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/22.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import "FWUserManager.h"

@implementation FWUserManager

SINGLETON_FOR_CLASS(FWUserManager);

#pragma mark ————— 三方登录 —————
-(void)login:(UserLoginType )loginType completion:(loginBlock)completion{
    //友盟登录类型
    UMSocialPlatformType platFormType;
    if (loginType == kUserLoginTypeQQ) {
        platFormType = UMSocialPlatformType_QQ;
    }else if (loginType == kUserLoginTypeWeChat) {
        platFormType = UMSocialPlatformType_WechatSession;
    }else{
        platFormType = UMSocialPlatformType_UnKnown;
    }
    //第三方登录
    [SVProgressHUD showWithStatus:@"授权中..."];
    [[FWThirdLoginManager shared] authForPlatform:platFormType completion:^(UMSocialUserInfoResponse *resp, NSError *error) {
        if (error) {
            [SVProgressHUD dismiss];
            if (completion) {
                completion(NO,error.localizedDescription);
            }
        } else {
            // 授权信息
            NSLog(@"Type uid: %@", resp.uid);
            NSLog(@"Type openid: %@", resp.openid);
            NSLog(@"Type accessToken: %@", resp.accessToken);
            NSLog(@"Type expiration: %@", resp.expiration);
            
            // 用户信息
            NSLog(@"Type name: %@", resp.name);
            NSLog(@"Type iconurl: %@", resp.iconurl);
            NSLog(@"Type gender: %@", resp.unionGender);
            
            // 第三方平台SDK源数据
            NSLog(@"Type originalResponse: %@", resp.originalResponse);
            
            // 登录参数
            NSDictionary *params = @{@"openid":resp.openid, @"nickname":resp.name, @"photo":resp.iconurl, @"sex":[resp.unionGender isEqualToString:@"男"]?@1:@2, @"cityname":resp.originalResponse[@"city"], @"fr":@(loginType)};
            
            self.loginType = loginType;
            // 登录到服务器
            [self loginToServer:params completion:completion];
        }
    }];
}

#pragma mark ————— 带参数登录 —————
-(void)loginWithParams:(NSDictionary *)params completion:(loginBlock)completion{
    [self loginToServer:params completion:completion];
}

#pragma mark ————— 手动登录到服务器 —————
-(void)loginToServer:(NSDictionary *)params completion:(loginBlock)completion{
    [SVProgressHUD showWithStatus:@"登录中..."];
    [PPNetworkHelper POST:loginURL parameters:params success:^(id responseObject) {
        [self LoginSuccess:responseObject completion:completion];

    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        if (completion) {
            completion(NO,error.localizedDescription);
        }
    }];
}

#pragma mark ————— 自动登录到服务器 —————
-(void)autoLoginToServer:(loginBlock)completion{
    [PPNetworkHelper POST:loginURL parameters:nil success:^(id responseObject) {
        [self LoginSuccess:responseObject completion:completion];

    } failure:^(NSError *error) {
        if (completion) {
            completion(NO,error.localizedDescription);
        }
    }];
}

#pragma mark ————— 登录成功处理 —————
-(void)LoginSuccess:(id )responseObject completion:(loginBlock)completion{
    if (ValidDict(responseObject[@"data"])) {
        NSDictionary *data = responseObject[@"data"];
        self.curUserInfo = [UserInfo modelWithDictionary:data];
        [self saveUserInfo];
        self.isLogined = YES;
        if (completion) {
            completion(YES,nil);
        }
        KPostNotification(KNotificationLoginStateChange, @YES);
    }else{
        if (completion) {
            completion(NO,@"登录返回数据异常");
        }
        KPostNotification(KNotificationLoginStateChange, @NO);
    }
}

#pragma mark ————— 储存用户信息 —————
-(void)saveUserInfo{
    if (self.curUserInfo) {
        YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
        NSDictionary *dic = [self.curUserInfo modelToJSONObject];
        [cache setObject:dic forKey:KUserModelCache];
    }
}

#pragma mark ————— 加载缓存的用户信息 —————
-(BOOL)loadUserInfo{
    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
    NSDictionary * userDic = (NSDictionary *)[cache objectForKey:KUserModelCache];
    if (userDic) {
        self.curUserInfo = [UserInfo modelWithJSON:userDic];
        return YES;
    }
    return NO;
}

#pragma mark ————— 退出登录 —————
- (void)logout:(void (^)(BOOL, NSString *))completion{
    self.curUserInfo = nil;
    self.isLogined = NO;

//    //移除缓存
    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
    [cache removeAllObjectsWithBlock:^{
        if (completion) {
            completion(YES,nil);
        }
    }];
    
    KPostNotification(KNotificationLoginStateChange, @NO);
}

@end

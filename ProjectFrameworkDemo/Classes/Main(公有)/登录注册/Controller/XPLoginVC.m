//
//  LoginVC.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/21.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "XPLoginVC.h"

#import "XPRegisterVC.h"
#import "XPLookPassVC.h"

#import "LoginLogoutRequestManager.h"

@interface XPLoginVC ()

@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation XPLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    
}

#pragma mark -登录按钮点击事件
- (IBAction)loginBtnClick:(UIButton *)sender {
#pragma mark -测试时使用
    if ([_mobileTF.text isEqualToString:@""] || [_passwordTF.text isEqualToString:@""]) {
        // 测试使用,测试账号
        _mobileTF.text = @"17710476973";
        _passwordTF.text = @"123456";
//        [SVProgressHUD showErrorWithStatus:@"请输入账号/密码"];
//        return;
    }
    if (![_mobileTF.text hd_isValidPhoneNum]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号"];
        return;
    }
    
    // 验证登录请求数据
    [self getLoginData];
}

#pragma mark -验证登录请求数据
-(void)getLoginData {
    [self TurnToMainVC];
    
    // 对用户名密码进行请求验证
    [[LoginLogoutRequestManager sharedManager] getLoginDataWithMobile:_mobileTF.text Password:_passwordTF.text IsAutoLogin:YES Success:^(id  _Nullable responseObject) {
        
        //      进入主界面
        [self TurnToMainVC];
    } Failure:^(NSError * _Nullable error) {

    }];
}

#pragma mark -跳转到主界面
- (void)TurnToMainVC {
    AppDelegate *application = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [application pushToMainVC];
}

#pragma mark -注册点击事件
- (IBAction)registerBtnClick:(UIButton *)sender {
    XPRegisterVC *zcVC = [[XPRegisterVC alloc] init];
    [self.navigationController pushViewController:zcVC animated:YES];
}

#pragma mark -忘记密码点击事件
- (IBAction)forgetBtnClick:(UIButton *)sender {
    XPLookPassVC *lookPassVC = [[XPLookPassVC alloc] init];
    
    [self.navigationController pushViewController:lookPassVC animated:YES];
}

- (IBAction)thirdLoginBtnClick:(UIButton *)sender {
    [[UMSocialManager defaultManager] cancelAuthWithPlatform:UMSocialPlatformType_WechatSession completion:^(id result, NSError *error) {
        [self authForPlatform:(UMSocialPlatformType_WechatSession) Success:^(UMSocialUserInfoResponse *resp) {
            // 第三方登录数据(为空表示平台未提供)
            // 授权数据
            UMSocialLogInfo(@" uid: %@", resp.uid);
            UMSocialLogInfo(@" openid: %@", resp.openid);
            UMSocialLogInfo(@" accessToken: %@", resp.accessToken);
            UMSocialLogInfo(@" refreshToken: %@", resp.refreshToken);
            UMSocialLogInfo(@" expiration: %@", resp.expiration);
            
            // 用户数据
            UMSocialLogInfo(@" name: %@", resp.name);
            UMSocialLogInfo(@" iconurl: %@", resp.iconurl);
            UMSocialLogInfo(@" gender: %@", resp.unionGender);
            
            // 第三方平台SDK原始数据
            UMSocialLogInfo(@" originalResponse: %@", resp.originalResponse);
        }];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

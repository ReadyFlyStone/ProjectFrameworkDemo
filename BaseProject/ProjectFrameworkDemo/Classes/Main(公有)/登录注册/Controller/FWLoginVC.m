//
//  FWLoginVC.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/21.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "FWLoginVC.h"

#import "FWRegisterVC.h"
#import "FWLookPassVC.h"

@interface FWLoginVC ()

@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation FWLoginVC

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
    [self turnToMainVC];
    
    // 对用户名密码进行请求验证
//    NSDictionary *params = @{@"mobile"   : _mobileTF.text,
//                             @"password" : _passwordTF.text
//                             };
//    [userManager loginWithParams:params completion:^(BOOL success, NSString *des) {
//        if (success) {
//            XPLog(@"登录成功");
//        }else{
//            XPLog(@"登录失败：%@", des);
//        }
//    }];
}

- (void)turnToMainVC {
    [kAppDelegate pushToMainVC];
}

#pragma mark -注册点击事件
- (IBAction)registerBtnClick:(UIButton *)sender {
    FWRegisterVC *zcVC = [[FWRegisterVC alloc] init];
    [self.navigationController pushViewController:zcVC animated:YES];
}

#pragma mark -忘记密码点击事件
- (IBAction)forgetBtnClick:(UIButton *)sender {
    FWLookPassVC *lookPassVC = [[FWLookPassVC alloc] init];
    
    [self.navigationController pushViewController:lookPassVC animated:YES];
}

#pragma mark - 第三方登录
- (IBAction)thirdLoginBtnClick:(UIButton *)sender {
    UserLoginType loginType = sender.tag - 100;
    [userManager login:loginType completion:^(BOOL success, NSString *des) {
        if (success) {
            XPLog(@"登录成功");
        }else{
            XPLog(@"登录失败：%@", des);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

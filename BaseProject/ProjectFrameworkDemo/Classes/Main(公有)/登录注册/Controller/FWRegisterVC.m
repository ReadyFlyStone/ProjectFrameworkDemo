//
//  FWRegisterVC.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/21.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "FWRegisterVC.h"

@interface FWRegisterVC ()

@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *firstPasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *secondPasswordTF;

@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation FWRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
    
}

#pragma mark -获取验证码按钮
- (IBAction)getCodeBtnClick:(UIButton *)sender {
    if ([_mobileTF.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
    if (![_mobileTF.text hd_isValidPhoneNum]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
        return;
    }
    
    [self getCodeData];
}

#pragma mark -注册按钮点击事件
- (IBAction)registerBtnClick:(UIButton *)sender {
    if ([_mobileTF.text isEqualToString:@""] || [_codeTF.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号/验证码"];
        return;
    }
    if (![_mobileTF.text hd_isValidPhoneNum]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
        return;
    }
    if ([_firstPasswordTF.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    if ([_secondPasswordTF.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请再次输入密码"];
        return;
    }
    if (_firstPasswordTF.text.length < 6 || _firstPasswordTF.text.length > 16) {
        [SVProgressHUD showErrorWithStatus:@"密码长度应在6~16位之间"];
        return;
    }
    if (![_firstPasswordTF.text isEqualToString:_secondPasswordTF.text]) {
        [SVProgressHUD showErrorWithStatus:@"两次密码不相同"];
        return;
    }
    
    [self getRegisterData];
}

- (void)getCodeData {
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    
//    [httpTool POST:yanzhengmaURL parameters:params success:^(id  _Nonnull responseObject) {
        [_getCodeBtn jk_startTime:59 title:@"获取验证码" waitTittle:@"获取验证码"];
//    } failure:^(NSError * _Nonnull error) {
//    
//    }];
}


- (void)getRegisterData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [httpTool POST:@"" parameters:params success:^(id  _Nonnull responseObject) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

@end

//
//  UIViewController+FWAlert.m
//  SheChiPin
//
//  Created by 周磊 on 2018/8/24.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import "UIViewController+FWAlert.h"

@implementation UIViewController (FWAlert)

- (void)showAlertSingleBtnWithTitle:(NSString *)title sureBlock:(SureBlock)sureBlock {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sureBlock) {
            sureBlock();
        }
    }];

    [alertVC addAction:sureAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)showAlertWithTitle:(NSString *)title sureBlock:(SureBlock)sureBlock {
//    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//
//    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        sureBlock();
//    }];
//
//    [alertVC addAction:cancleAction];
//    [alertVC addAction:sureAction];
//    [self presentViewController:alertVC animated:YES completion:nil];
    [self showAlertWithTitle:title type:(UIAlertControllerStyleAlert) FirstName:@"取消" secondName:@"确定" backBlock:^(NSInteger index) {
        if (index == 1) {
            if (sureBlock) {
                sureBlock();
            }
        }
    }];
}

- (void)showAlertWithTitle:(NSString *)title type:(UIAlertControllerStyle)type FirstName:(NSString *)firstName secondName:(NSString *)secondName backBlock:(BackBlock)backBlock {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:type];
    
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:firstName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (backBlock) {
            backBlock(0);
        }
    }];
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:secondName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (backBlock) {
            backBlock(1);
        }
    }];
    
    [alertVC addAction:firstAction];
    [alertVC addAction:secondAction];
    
    if (type == UIAlertControllerStyleActionSheet) {
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:cancleAction];
    }
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end

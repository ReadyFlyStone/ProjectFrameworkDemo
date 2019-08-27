//
//  UIViewController+FWAlert.h
//  SheChiPin
//
//  Created by 周磊 on 2018/8/24.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackBlock)(NSInteger index);
typedef void(^SureBlock)(void);

@interface UIViewController (FWAlert)
// 单按钮 (我知道了)
- (void)showAlertSingleBtnWithTitle:(NSString *)title sureBlock:(SureBlock)sureBlock;
// 双按钮 (取消/确定)
- (void)showAlertWithTitle:(NSString *)title sureBlock:(SureBlock)sureBlock;

- (void)showAlertWithTitle:(NSString *)title type:(UIAlertControllerStyle)type FirstName:(NSString *)firstName secondName:(NSString *)secondName backBlock:(BackBlock)backBlock;

@end

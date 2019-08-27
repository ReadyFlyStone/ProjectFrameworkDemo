//
//  XPTurnDownBtn.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/12/19.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^XPTurnDownBtnBlock)(void);

@interface XPTurnDownBtn : UIButton

@property (nonatomic, copy) XPTurnDownBtnBlock turnDownBlock;

+ (instancetype)initWithFrame:(CGRect)frame;

- (void)startCoundown;

@end

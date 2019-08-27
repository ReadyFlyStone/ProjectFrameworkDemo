//
//  UIButton+countDown.h
//  NetworkEgOc
//
//  Created by iosdev on 15/3/17.
//  Copyright (c) 2015年 iosdev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FinishBlock)(void);

@interface UIButton (JKCountDown)
-(void)jk_startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;

-(void)jk_startTime:(NSInteger )timeout waitFinishBlock:(FinishBlock)finishBlock;

@end

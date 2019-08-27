//
//  XPAdPageView.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/12/21.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 启动广告页面
 */

static NSString *const adImageName = @"adImageName";
static NSString *const adUrl = @"adUrl";

typedef void(^TapBlock)(void);

@interface XPAdPageView : UIView

- (instancetype)initWithFrame:(CGRect)frame withTapBlock:(TapBlock)tapBlock;

/** 显示广告页面方法*/
- (void)show;

/** 图片路径*/
@property (nonatomic, copy) NSString *filePath;

@end

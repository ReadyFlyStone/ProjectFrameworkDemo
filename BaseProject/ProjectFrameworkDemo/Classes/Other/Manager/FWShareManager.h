//
//  FWShareManager.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/22.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FWShareManager : NSObject

/**
 创建工具单例
 */
+ (instancetype)shared;

/**
 底部展示分享面板
 **/
- (void)share_showBottomShareView;

/**
 中部展示分享面板
 **/
- (void)share_showMiddleShareView;

@end


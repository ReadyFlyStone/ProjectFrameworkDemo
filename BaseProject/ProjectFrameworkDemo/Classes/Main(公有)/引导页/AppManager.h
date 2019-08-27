//
//  AppManager.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/12/19.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 包含应用层的相关服务
 */
@interface AppManager : NSObject

#pragma mark ————— APP启动接口 —————
+(void)appStart;

#pragma mark ————— FPS 监测 —————
+(void)showFPS;

@end

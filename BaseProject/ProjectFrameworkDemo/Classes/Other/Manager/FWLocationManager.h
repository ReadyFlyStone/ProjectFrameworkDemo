//
//  FWLocationManager.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/19.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

/*
 ******请求用户权限,需要在info.plist中添加两个值******
 
 Privacy - Location Always Usage Description
 Privacy - Location When In Use Usage Description
 
 定位权限
 
 在项目的 Info.plist 添加如下字段
 NSLocationWhenInUseUsageDescription 表示应用在前台的时候可以搜到更新的位置信息。
 NSLocationAlwaysUsageDescription 表示应用在前台和后台（suspend 或 terminated）都可以获取到更新的位置数据。
 */

typedef void (^GetLocationBlock)(NSDictionary *locationInfo);

@interface FWLocationManager : NSObject

/**
 创建工具单例
 */
+ (instancetype)shared;

@property (nonatomic, copy) GetLocationBlock locationBlock;

/**
 开始定位
 
 @param locationBlock 返回定位信息
 */
- (void)startLocationAddress:(GetLocationBlock)locationBlock;

@end

//
//  VersionManager.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/18.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FWVersionManager : NSObject

/**
 *  @param appStoreID          应用在AppStore里面的ID (在iTunes Connect中获取)
 *                             Apple ID (为您的 App 自动生成的 ID)
 *                             1014895889
 *
 *  @param currentController   要显示的controller
 *  @param isShowReleaseNotes  是否显示版本更新日志
 */
+ (void)updateVersionWithAppStoreID:(NSString *)appStoreID
            showInCurrentController:(UIViewController *)currentController
                 isShowReleaseNotes:(BOOL)isShowReleaseNotes;

@end

NS_ASSUME_NONNULL_END

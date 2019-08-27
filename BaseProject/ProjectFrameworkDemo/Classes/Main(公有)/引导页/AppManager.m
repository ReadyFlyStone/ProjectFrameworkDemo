//
//  AppManager.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/12/19.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "AppManager.h"
#import "XPAdPageView.h"
#import "YYFPSLabel.h"

@implementation AppManager


+(void)appStart{
    //加载广告
    XPAdPageView *adView = [[XPAdPageView alloc] initWithFrame:kScreen_Bounds withTapBlock:^{
        [[AppDelegate shareAppDelegate] pushToMainVC];
    }];
    adView = adView;
}
#pragma mark ————— FPS 监测 —————
+(void)showFPS {
    YYFPSLabel *_fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = kScreenH - 55;
    _fpsLabel.right = kScreenW - 10;
//    _fpsLabel.alpha = 0;
    [kAppWindow addSubview:_fpsLabel];
    [kAppWindow bringSubviewToFront:_fpsLabel];
}

@end

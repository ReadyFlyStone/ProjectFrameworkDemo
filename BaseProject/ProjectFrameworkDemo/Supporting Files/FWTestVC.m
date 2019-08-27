//
//  FWTestVC.m
//  SheChiPin
//
//  Created by 周磊 on 2018/8/27.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import "FWTestVC.h"

@interface FWTestVC ()<UMSocialShareMenuViewDelegate>

@end

@implementation FWTestVC
{
    dispatch_group_t group;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试页";
    [self setNavRightMoreModel:(BaseViewNavStyleRightShare)];
    
    [FWVersionManager updateVersionWithAppStoreID:@"1289515761" showInCurrentController:self isShowReleaseNotes:YES];
    
    [self startLocation];
//    [self GCDSyncGroupNotify];
//    [self GCDASyncGroupNotify];
}

- (void)toPushNav:(UIButton *)sender {
    [[FWShareManager shared] share_showBottomShareView];
}

- (void)startLocation {
    [[FWLocationManager shared] startLocationAddress:^(NSDictionary *locationInfo) {
        XPLog(@"%@", locationInfo);
        XPLog(@"%@", [locationInfo objectForKey:@"country"]);
        XPLog(@"%@", [locationInfo objectForKey:@"administrativeArea"]);
        XPLog(@"%@", [locationInfo objectForKey:@"locality"]);
        XPLog(@"%@", [locationInfo objectForKey:@"subLocality"]);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)GCDSyncGroupNotify {
    // 同步执行
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t groupQueue = dispatch_get_global_queue(0, 0);
    dispatch_group_async(group, groupQueue, ^{
        XPLog(@"123");
    });
    dispatch_group_async(group, groupQueue, ^{
        XPLog(@"456");
    });
    dispatch_group_notify(group, groupQueue, ^{
        XPLog(@"789");
    });
}

- (void)GCDASyncGroupNotify {
    // 异步执行
    group = dispatch_group_create();
    
    [self getFirstData];
    [self getSecondData];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        XPLog(@"-789");
    });
}

- (void)getFirstData {
    dispatch_group_enter(group);
    [httpTool POST:@"" parameters:@{} success:^(id  _Nonnull responseObject) {
        XPLog(@"-123");
        dispatch_group_leave(group);
    } failure:^(NSError * _Nonnull error) {
        XPLog(@"-123");
        dispatch_group_leave(group);
    }];
}

- (void)getSecondData {
    dispatch_group_enter(group);
    [httpTool POST:@"" parameters:@{} success:^(id  _Nonnull responseObject) {
        XPLog(@"-456");
        dispatch_group_leave(group);
    } failure:^(NSError * _Nonnull error) {
        XPLog(@"-456");
        dispatch_group_leave(group);
    }];
}

@end

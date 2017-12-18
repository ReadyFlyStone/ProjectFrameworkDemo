//
//  RootTabBarController.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 16/6/8.
//  Copyright © 2016年 xiaopao. All rights reserved.
//

#import "RootTabBarController.h"

@interface RootTabBarController ()

@property (nonatomic, strong) NSArray *vcArray;

@end

@implementation RootTabBarController

- (NSArray *)vcArray {
    if (!_vcArray) {
        _vcArray = @[@[@"首页", @"", @""], @[@"我的", @"", @""]];
    }
    return _vcArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setSubVCs];
}

- (void)setSubVCs {
    HomeVC *homeVC = [[HomeVC alloc] initWithTitle:self.vcArray[0][0] withNormalImage:self.vcArray[0][1] withSelectedImage:self.vcArray[0][2]];
    UserCenterVC *userCenterVC = [[UserCenterVC alloc] initWithTitle:self.vcArray[1][0] withNormalImage:self.vcArray[1][1] withSelectedImage:self.vcArray[1][2]];
    
    RootNavigationController *nav1 = [[RootNavigationController alloc] initWithRootViewController:homeVC];
    RootNavigationController *nav2 = [[RootNavigationController alloc] initWithRootViewController:userCenterVC];
    
    self.viewControllers = @[nav1, nav2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

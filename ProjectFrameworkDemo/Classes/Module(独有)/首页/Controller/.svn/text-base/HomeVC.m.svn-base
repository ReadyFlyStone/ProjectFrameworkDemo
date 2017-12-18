//
//  HomeVC.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 16/6/8.
//  Copyright © 2016年 xiaopao. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()<UMSocialShareMenuViewDelegate>

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavRightMoreModel:(BaseViewNavStyleRightShare)];
    
}

- (void)toPushNav:(UIButton *)sender {
    [self share_showBottomShareView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.title = @"二级界面";
    vc.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

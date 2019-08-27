//
//  RootTableViewController.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/16.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "RootTableViewController.h"

#import "BaseTableDelegate.h"

@interface RootTableViewController ()

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)headerRefresh {
    __block int weakPageNum = self.pageNum;
    XPWeakSelf
    self.tableView.mj_header.refreshingBlock = ^{
        weakPageNum = 1;
        [weakSelf getData];
    };
    [self.tableView.mj_header beginRefreshing];
}

- (void)footerRefresh {
    __block int weakPageNum = self.pageNum;
    XPWeakSelf
    self.tableView.mj_footer.refreshingBlock = ^{
        weakPageNum ++;
        [weakSelf getData];
    };
}

- (void)headerFooterRefresh {
    [self headerRefresh];
    [self footerRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

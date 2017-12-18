//
//  RootTableViewController.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/16.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "RootTableViewController.h"

#import "BaseTableDelegate.h"

@interface RootTableViewController () <UITableViewHelperDelegate>

@end

@implementation RootTableViewController
{
    BaseTableDelegate *_delegateHelper;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [UIView new];
        
        _delegateHelper = [[BaseTableDelegate alloc] init];
        _delegateHelper.delegate = self;
        _tableView.delegate = _delegateHelper;
        _tableView.dataSource = _delegateHelper;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

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

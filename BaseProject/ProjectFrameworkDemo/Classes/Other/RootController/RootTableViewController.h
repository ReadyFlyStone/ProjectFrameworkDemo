//
//  RootTableViewController.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/16.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "QMUICommonTableViewController.h"

@interface RootTableViewController : QMUICommonTableViewController

@property (nonatomic, assign) int pageNum;

- (void)headerRefresh;
- (void)footerRefresh;
- (void)headerFooterRefresh;

@end

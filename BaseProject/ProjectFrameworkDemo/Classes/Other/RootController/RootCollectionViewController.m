//
//  RootCollectionViewController.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/9/16.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "RootCollectionViewController.h"

#import "BaseCollectDelegate.h"

@interface RootCollectionViewController ()

@end

@implementation RootCollectionViewController

- (UICollectionViewLayout *)collectionViewLayout {
    if (!_collectionViewLayout) {
        _collectionViewLayout = [[UICollectionViewLayout alloc] init];
    }
    return _collectionViewLayout;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.collectionViewLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];

        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageNum = 1;
}

- (void)headerRefresh {
    __block int weakPageNum = self.pageNum;
    XPWeakSelf
    self.collectionView.mj_header.refreshingBlock = ^{
        weakPageNum = 1;
        [weakSelf getData];
    };
    [self.collectionView.mj_header beginRefreshing];
}

- (void)footerRefresh {
    __block int weakPageNum = self.pageNum;
    XPWeakSelf
    self.collectionView.mj_footer.refreshingBlock = ^{
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

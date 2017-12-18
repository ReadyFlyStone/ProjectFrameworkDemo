//
//  BaseCollectDelegate.m
//  DDShop
//
//  Created by soso on 15/9/22.
//  Copyright (c) 2015年 k6161061. All rights reserved.
//

#import "BaseCollectDelegate.h"

@implementation BaseCollectDelegate
#pragma mark - collectView Delegate && 处理事件 -
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *homecollectionViewCell = @"cell";
    UICollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:homecollectionViewCell forIndexPath:indexPath];
    return collectionCell;
}


//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake((kScreenW)/3, 120);
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // select
}
@end

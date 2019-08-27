//
//  BaseCollectDelegate.h
//  DDShop
//
//  Created by soso on 15/9/22.
//  Copyright (c) 2015年 k6161061. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UICollectViewHelperDelegate <NSObject>
@optional
/** 点击cell 执行该代理方法 */
-(void)collectionViewWith:(UICollectionView *)collectView selectWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface BaseCollectDelegate : NSObject<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    
}
/** 数据 */
@property (nonatomic,strong)NSArray *arrItem;

/** 代理 */
@property (nonatomic,weak)id<UICollectViewHelperDelegate> delegate;

@end

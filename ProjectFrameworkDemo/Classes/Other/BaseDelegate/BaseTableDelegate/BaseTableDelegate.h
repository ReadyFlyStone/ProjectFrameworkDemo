//
//  BaseTableDelgate.h
//  DDShop
//
//  Created by soso on 15/9/22.
//  Copyright (c) 2015年 k6161061. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol UITableViewHelperDelegate <NSObject>
@optional

/** 点击cell 执行该代理方法 */
-(void)tableViewWith:(UITableView *)tableView selectWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface BaseTableDelegate : NSObject <UITableViewDataSource,UITableViewDelegate>
{
    
}
/** 数据 */
@property (nonatomic,strong)NSArray *arrItem;

/** 代理 */
@property (nonatomic,weak)id<UITableViewHelperDelegate> delegate;

@end

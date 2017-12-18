
//
//  BaseTableDelgate.m
//  DDShop
//
//  Created by soso on 15/9/22.
//  Copyright (c) 2015年 k6161061. All rights reserved.
//

#import "BaseTableDelegate.h"

@implementation BaseTableDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(tableViewWith:selectWithIndexPath:)]) {
        [self.delegate tableViewWith:tableView selectWithIndexPath:indexPath];
    }
}

@end

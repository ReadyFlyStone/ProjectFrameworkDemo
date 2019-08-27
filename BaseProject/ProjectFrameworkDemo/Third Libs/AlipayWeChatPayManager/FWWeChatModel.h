//
//  FWWeChatModel.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/19.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FWWeChatModel : NSObject

@property(nonatomic,copy)NSString *timestamp;//时间戳
@property(nonatomic,copy)NSString *partnerid;
@property(nonatomic,copy)NSString *package;
@property(nonatomic,copy)NSString *noncestr;
@property(nonatomic,copy)NSString *sign;
@property(nonatomic,copy)NSString *appid;
@property(nonatomic,copy)NSString *prepayid;

@end

NS_ASSUME_NONNULL_END

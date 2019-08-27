//
//  FWIMManager.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/22.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <NIMSDK/NIMSDK.h>

typedef void (^loginBlock)(BOOL success, NSString * des);

/**
 IM服务与管理
 */
@interface FWIMManager : NSObject

SINGLETON_FOR_HEADER(FWIMManager);

/**
 初始化IM
 */
-(void)initIM;


/**
 登录IM

 @param IMID IM账号
 @param IMPwd IM密码
 @param completion block回调
 */
-(void)IMLogin:(NSString *)IMID IMPwd:(NSString *)IMPwd completion:(loginBlock)completion;

/**
 退出IM
 */
-(void)IMLogout;

@end

//
//  FWHttpRequest.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/24.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 以下Block的参数你根据自己项目中的需求来指定, 这里仅仅是一个演示的例子
 */

/**
 请求成功的block
 
 @param info     返回信息
 @param response 响应体数据
 */
typedef void(^FWRequestSuccess)(id response);
/**
 请求失败的block
 
 @param extInfo 扩展信息
 */
typedef void(^FWRequestFailure)(NSError *error);

@interface FWHttpRequest : NSObject

//+ (NSURLSessionTask *)getWithUrl:(NSString *)url parameters:(id)parameters success:(FWRequestSuccess)success failure:(FWRequestFailure)failure;
//
//+ (NSURLSessionTask *)getWithUrl:(NSString *)url parameters:(id)parameters success:(FWRequestSuccess)success failure:(FWRequestFailure)failure;

@end


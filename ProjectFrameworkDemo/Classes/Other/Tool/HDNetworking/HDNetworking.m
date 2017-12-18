//
//  HDNetworking.m
//  PortableTreasure
//
//  Created by HeDong on 16/2/10.
//  Copyright © 2016年 hedong. All rights reserved.
//

#import "HDNetworking.h"
#import "HDPicModle.h"

#import "AFNetworking.h"
#import "NSObject+GetCurrentVC.h"

@implementation HDNetworking
HDSingletonM(HDNetworking) // 单例实现

/**
 *  网络监测(在什么网络状态)
 *
 *  @param unknown          未知网络
 *  @param reachable        无网络
 *  @param reachableViaWWAN 蜂窝数据网
 *  @param reachableViaWiFi WiFi网络
 */
- (void)networkStatusUnknown:(Unknown)unknown reachable:(Reachable)reachable reachableViaWWAN:(ReachableViaWWAN)reachableViaWWAN reachableViaWiFi:(ReachableViaWiFi)reachableViaWiFi;
{
    // 创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 监测到不同网络的情况
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
                unknown();
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                reachable();
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                reachableViaWWAN();
                
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                reachableViaWiFi();
                break;
                
            default:
                break;
        }
    }] ;
    
    // 开始监听网络状况
    [manager startMonitoring];
}

/**
 *  封装的get请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)GET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(Successs)success failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:projectBaseURL]];
    
    NSMutableSet *contentTypes = [[NSMutableSet alloc] initWithSet:manager.responseSerializer.acceptableContentTypes];
    [contentTypes addObject:@"text/html"];
    [contentTypes addObject:@"text/plain"];
    
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : 20);
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    if ([parameters isKindOfClass:[NSMutableDictionary class]]) {
         [parameters setValue:[HWAccountTool account].sessionId forKey:@"sessionId"];
    }
    NSLog(@"URLString  %@ ", URLString);
    NSLog(@"parameters  %@ ", parameters);

    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        XPLog(@"responseObject  %@ ", responseObject);
        if (![self judgeResultAndhandleWithCode:responseObject]) {
            NSError *error = [[NSError alloc] initWithDomain:@"" code:[[responseObject valueForKey:@"code"] integerValue] userInfo:@{@"msg" : [responseObject valueForKey:@"desc"]}];
            failure(error);
            return ;
        }

        if (success)
        {
            success(responseObject);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            [SVProgressHUD showErrorWithStatus:@"访问失败"];
            failure(error);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
}

/**
 *  封装的POST请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(Successs)success failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:projectBaseURL]];
    
    NSMutableSet *contentTypes = [[NSMutableSet alloc] initWithSet:manager.responseSerializer.acceptableContentTypes];
    [contentTypes addObject:@"text/html"];
    [contentTypes addObject:@"text/plain"];
    
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : 20);
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES]; // 开启状态栏动画
    
    if ([parameters isKindOfClass:[NSMutableDictionary class]]) {
        [parameters setValue:[HWAccountTool account].sessionId forKey:@"sessionId"];
    }
    NSLog(@"URLString  %@ ", URLString);
    NSLog(@"parameters  %@ ", parameters);
    
    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        XPLog(@"%@", responseObject);
        if (![self judgeResultAndhandleWithCode:responseObject]) {
            NSError *error = [[NSError alloc] initWithDomain:@"" code:[[responseObject valueForKey:@"code"] integerValue] userInfo:@{@"msg" : [responseObject valueForKey:@"desc"]}];
            failure(error);
            return ;
        }
        
        if (success)
        {
            success(responseObject);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            [SVProgressHUD showErrorWithStatus:@"访问失败,请重试"];
            failure(error);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
    }];
}

/**
 *  封装POST图片上传(多张图片) // 可扩展成多个别的数据上传如:mp3等
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param picArray   存放图片模型(HDPicModle)的数组
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters andPicArray:(NSArray<HDPicModle *> *)picArray progress:(Progress)progress success:(Successs)success failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:projectBaseURL]];
    
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : 20);
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 请求不使用AFN默认转换,保持原有数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // 响应不使用AFN默认转换,保持原有数据
    
    if ([parameters isKindOfClass:[NSMutableDictionary class]]) {
        [parameters setValue:[HWAccountTool account].sessionId forKey:@"sessionId"];
    }
    NSLog(@"URLString  %@ ", URLString);
    NSLog(@"parameters  %@ ", parameters);

    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSInteger count = picArray.count;
        NSString *fileName = @"";
        NSData *data = [NSData data];
        
        for (int i = 0; i < count; i++)
        {
            @autoreleasepool {
                HDPicModle *picModle = picArray[i];
                fileName = [NSString stringWithFormat:@"pic%02d.jpg", i];
                /**
                 *  压缩图片然后再上传(1.0代表无损 0~~1.0区间)
                 */
                data = UIImageJPEGRepresentation(picModle.pic, 1.0);
                CGFloat precent = self.picSize / (data.length / 1024.0);
                if (precent > 1)
                {
                    precent = 1.0;
                }
                data = nil;
                data = UIImageJPEGRepresentation(picModle.pic, precent);
                
                [formData appendPartWithFileData:data name:picModle.picName fileName:fileName mimeType:@"image/jpeg"];
                data = nil;
                picModle.pic = nil;
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress)
        {
            progress(uploadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            responseObject = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
            
            XPLog(@"%@", responseObject);
            if (![self judgeResultAndhandleWithCode:responseObject]) {
                NSError *error = [[NSError alloc] initWithDomain:@"" code:[[responseObject valueForKey:@"code"] integerValue] userInfo:@{@"msg" : [responseObject valueForKey:@"desc"]}];
                failure(error);
                return ;
            }

            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            [SVProgressHUD showErrorWithStatus:@"访问失败"];
            failure(error);
        }
    }];
}

/**
 *  封装POST图片上传(单张图片) // 可扩展成单个别的数据上传如:mp3等
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param picModle   上传的图片模型
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters andPic:(HDPicModle *)picModle progress:(Progress)progress success:(Successs)success failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:projectBaseURL]];
    
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : 20);
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 请求不使用AFN默认转换,保持原有数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // 响应不使用AFN默认转换,保持原有数据
    
    if ([parameters isKindOfClass:[NSMutableDictionary class]]) {
        [parameters setValue:[HWAccountTool account].sessionId forKey:@"sessionId"];
    }
    NSLog(@"URLString  %@ ", URLString);
    NSLog(@"parameters  %@ ", parameters);

    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        /**
         *  压缩图片然后再上传(1.0代表无损 0~~1.0区间)
         */
        NSData *data = UIImageJPEGRepresentation(picModle.pic, 1.0);
        CGFloat precent = self.picSize / (data.length / 1024.0);
        if (precent > 1)
        {
            precent = 1.0;
        }
        data = nil;
        data = UIImageJPEGRepresentation(picModle.pic, precent);
        
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", picModle.picName];
        
        [formData appendPartWithFileData:data name:picModle.picName fileName:fileName mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress)
        {
            progress(uploadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            responseObject = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
            
            XPLog(@"%@", responseObject);
            if (![self judgeResultAndhandleWithCode:responseObject]) {
                NSError *error = [[NSError alloc] initWithDomain:@"" code:[[responseObject valueForKey:@"code"] integerValue] userInfo:@{@"msg" : [responseObject valueForKey:@"desc"]}];
                failure(error);
                return ;
            }
            
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            [SVProgressHUD showErrorWithStatus:@"访问失败"];
            failure(error);
        }
    }];
}

/**
 *  封装POST上传url资源
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param picModle   上传的图片模型(资源的url地址)
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters andPicUrl:(HDPicModle *)picModle progress:(Progress)progress success:(Successs)success failure:(Failure)failure;
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:projectBaseURL]];
    
    manager.responseSerializer.acceptableContentTypes = self.acceptableContentTypes;
    manager.requestSerializer.timeoutInterval = (self.timeoutInterval ? self.timeoutInterval : 20);
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 请求不使用AFN默认转换,保持原有数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // 响应不使用AFN默认转换,保持原有数据
    
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", picModle.picName];
        // 根据本地路径获取url(相册等资源上传)
        NSURL *url = [NSURL fileURLWithPath:picModle.url]; // [NSURL URLWithString:picModle.url] 可以换成网络的图片在上传
        
        [formData appendPartWithFileURL:url name:picModle.picName fileName:fileName mimeType:@"application/octet-stream" error:nil];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress)
        {
            progress(uploadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            responseObject = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
            
            XPLog(@"%@", responseObject);
            if (![self judgeResultAndhandleWithCode:responseObject]) {
                NSError *error = [[NSError alloc] initWithDomain:@"" code:[[responseObject valueForKey:@"code"] integerValue] userInfo:@{@"msg" : [responseObject valueForKey:@"desc"]}];
                failure(error);
                return ;
            }
            
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            [SVProgressHUD showErrorWithStatus:@"访问失败"];
            failure(error);
        }
    }];
}

/**
 *  下载
 *
 *  @param URLString       请求的链接
 *  @param progress        进度的回调
 *  @param destination     返回URL的回调
 *  @param downLoadSuccess 发送成功的回调
 *  @param failure         发送失败的回调
 */
- (NSURLSessionDownloadTask *)downLoadWithURL:(NSString *)URLString progress:(Progress)progress destination:(Destination)destination downLoadSuccess:(DownLoadSuccess)downLoadSuccess failure:(Failure)failure;
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:projectBaseURL]];

    NSURL *url = [NSURL URLWithString:URLString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (progress)
        {
            progress(downloadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        if (destination)
        {
            return destination(targetPath, response);
        }
        else
        {
            return nil;
        }
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error)
        {
            [SVProgressHUD showErrorWithStatus:@"访问失败"];
            failure(error);
        }
        else
        {
            downLoadSuccess(response, filePath);
        }
    }];
    
    // 开始启动任务
    [task resume];
    
    return task;
}

- (BOOL)judgeResultAndhandleWithCode:(id)responseObject {
    [SVProgressHUD dismiss];
    if ([[responseObject valueForKey:@"code"] integerValue]==0) {
        [SVProgressHUD showErrorWithStatus:responseObject[@"desc"]];
        return NO;
    }
    if ([[responseObject valueForKey:@"code"] integerValue]==2) {
        UIViewController *vc = [self getCurrentVC];
        if (![vc isKindOfClass:[XPLoginVC class]]) {
            if ([vc isKindOfClass:[RootTabBarController class]]) {
                RootTabBarController *tabberVC = (RootTabBarController *)vc;
                RootNavigationController *nav = (RootNavigationController *)tabberVC.viewControllers[tabberVC.selectedIndex];
                RootNavigationController *nav1 = [[RootNavigationController alloc] initWithRootViewController:[XPLoginVC new]];
                [nav presentViewController:nav1 animated:YES completion:nil];
            } else {
                RootNavigationController *nav = [[RootNavigationController alloc] initWithRootViewController:[XPLoginVC new]];
                [vc presentViewController:nav animated:YES completion:nil];
            }
        }
        GVUserDefault.isLogin = NO;
        GVUserDefault.isAutoLogin = NO;
        return NO;
    }
    return YES;
}

@end

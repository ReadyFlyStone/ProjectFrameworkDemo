//
//  Config.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 16/6/8.
//  Copyright © 2016年 xiaopao. All rights reserved.
//

#ifndef Config_h
#define Config_h

// 屏幕宽高
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

// 判断是否iPhoneX
#define IS_IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 弱引用
#define XPWeakSelf __weak typeof(self) weakSelf = self;

// 颜色 每次自己进行修改
#define Main_Color [UIColor colorWithRed:(3)/255.0 green:(160)/255.0 blue:(235)/255.0 alpha:1.0]
#define Main2_Color [UIColor colorWithRed:(135)/255.0 green:(202)/255.0 blue:(231)/255.0 alpha:1.0]
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

// 16进制色传入
#define UIColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//获取图片资源
#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//默认图片
#define Deflaut_Image_Name @"a37"

#define Deflaut_Image [UIImage imageNamed:Deflaut_Image_Name]

// 通知
#define XPNotificationCenter [NSNotificationCenter defaultCenter]
// 偏好设置扩展
#define GVUserDefault [GVUserDefaults standardUserDefaults]

// 网络请求工具对象
#define httpTool [HDNetworking sharedHDNetworking]

// 项目网络图片地址String
#define MergeUrl(url) ([NSString stringWithFormat:@"%@%@", projectBaseURL, url])

//打印
#ifdef DEBUG
#define XPLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define XPLog(...)
#endif

// 设置字体大小
#define font(size) [UIFont systemFontOfSize:size]

// 占位字符字体
#define SET_PLACE(text) [text  setValue:[UIFont boldSystemFontOfSize:(14)] forKeyPath:@"_placeholderLabel.font"];

// Alert提示宏定义
#define Alert(_S_, ...) [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]

#endif /* Config_h */

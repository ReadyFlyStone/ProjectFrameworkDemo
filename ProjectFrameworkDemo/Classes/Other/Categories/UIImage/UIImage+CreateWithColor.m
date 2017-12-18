//
//  UIImage+CreateWithColor.m
//  WanJia
//
//  Created by 周磊 on 2017/4/7.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "UIImage+CreateWithColor.h"

@implementation UIImage (CreateWithColor)

+ (UIImage *)createImageWithFrame:(CGRect)rect Color:(UIColor *)color
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myImage;
}

+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f,0.0f,kScreenW, kScreenH);
    return [self createImageWithFrame:rect Color:color];
}

@end

//
//  FWStarRating.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/10/19.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FWStarRating;

NS_ASSUME_NONNULL_BEGIN

/**
 *  星级评分条代理
 */
@protocol FWStarRatingDelegate <NSObject>

/**
 *  评分改变
 *
 *  @param starRating 评分控件
 *  @param selectedScore 评分值
 */
- (void)starRating:(FWStarRating *)starRating selectedScore:(NSNumber *)selectedScore;

@end

@interface FWStarRating : UIView

/**
 *  初始化设置未选中图片、半选中图片、全选中图片，以及评分值改变的代理（可以用
 *  Block）实现
 *
 *  @param deselectedName   未选中图片名称
 *  @param halfSelectedName 半选中图片名称
 *  @param fullSelectedName 全选中图片名称
 *  @param delegate          代理
 */
- (void)setImageDeselected:(NSString *)deselectedName halfSelected:(NSString *)halfSelectedName fullSelected:(NSString *)fullSelectedName andDelegate:(id<FWStarRatingDelegate>)delegate;

/**
 *  设置评分值
 *
 *  @param rating 评分值
 */
- (void)displayRating:(float)rating;

/**
 *  获取当前的评分值
 *
 *  @return 评分值
 */
- (float)rating;

/**
 *  是否是指示器，如果是指示器，就不能滑动了，只显示结果，不是指示器的话就能滑动修改值
 *  默认为NO
 */
@property (nonatomic,assign) BOOL isIndicator;

@end

NS_ASSUME_NONNULL_END

//
//  XPAdPageView.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2017/12/21.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "XPAdPageView.h"
#import "XPTurnDownBtn.h"
#import "DrawCircleProgressButton.h"

@interface XPAdPageView()

@property (nonatomic, strong) UIImageView *adView;

@property (nonatomic, strong) XPTurnDownBtn *turnBtn;

@property (nonatomic, strong) DrawCircleProgressButton *circleBtn;

@property (nonatomic, copy) TapBlock tapBlock;

@end

@implementation XPAdPageView

- (UIImageView *)adView {
    if (!_adView) {
        _adView = [[UIImageView alloc] init];
        _adView.contentMode = UIViewContentModeScaleAspectFill;
        _adView.clipsToBounds = YES;
        _adView.userInteractionEnabled = YES;
        [self addSubview:_adView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToAd)];
        [_adView addGestureRecognizer:tap];
    }
    return _adView;
}

- (XPTurnDownBtn *)turnBtn {
    if (!_turnBtn) {
        CGFloat btnW = 60;
        CGFloat btnH = 30;
        _turnBtn = [XPTurnDownBtn initWithFrame:CGRectMake(kScreenW - btnW - 24, kTopHeight, btnW, btnH)];
        XPWeakSelf
        _turnBtn.turnDownBlock = ^{
            [weakSelf dismiss];
        };
        [self addSubview:_turnBtn];
    }
    return _turnBtn;
}

- (DrawCircleProgressButton *)circleBtn {
    if (!_circleBtn) {
        _circleBtn = [[DrawCircleProgressButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 55, 30, 40, 40)];
        [[_circleBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self dismiss];
        }];
        [self addSubview:_circleBtn];
    }
    return _circleBtn;
}

- (instancetype)initWithFrame:(CGRect)frame withTapBlock:(TapBlock)tapBlock {
    if (self = [super initWithFrame:frame]) {
        // 广告图片
        self.adView.frame = frame;
        
        // 1.判断沙盒中是否存在广告图片,如果存在,直接显示
        NSString *filePath = [self getFilePathWithImageName:[kUserDefaults valueForKey:adImageName]];
        
        BOOL isExist = [self isFileExistWithFilePath:filePath];
        if (isExist) {
            [self setFilePath:filePath];
            self.tapBlock = tapBlock;
            [self show];
        }
        
        // 2.无论沙盒中是否存在广告图片,都需要重新调用广告接口,判断广告是否更新
        [self getAdvertisingImage];
    }
    return self;
}

- (NSString *)getFilePathWithImageName:(NSString *)imageName {
    if (imageName) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageName];
        
        return filePath;
    }
    return nil;
}

- (BOOL)isFileExistWithFilePath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = FALSE;
    return [fileManager fileExistsAtPath:filePath isDirectory:&isDirectory];
}

- (void)setFilePath:(NSString *)filePath {
    _filePath = filePath;
    _adView.image = [UIImage imageWithContentsOfFile:filePath];
}

- (void)show {
    // 第一种:数字倒计时跳转按钮
//    [self.turnBtn startCoundown];
    // 第二种:进度条倒计时跳转按钮
    XPWeakSelf
    [self.circleBtn startAnimationDuration:5 withBlock:^{
        [weakSelf dismiss];
    }];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    [window bringSubviewToFront:self];
}

// 移除广告页面
- (void)dismiss {
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)getAdvertisingImage {
    [self getLocationImageUrlData];
//    [self getImageUrlData];
}

// 演示图片地址数组
- (void)getLocationImageUrlData {
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    NSString *imageUrl = imageArray[arc4random() % imageArray.count];
    
    [self pieceTogetherPathWithImageUrl:imageUrl];
}
// 实际网络请求图片地址
- (void)getImageUrlData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"<#abc#>"] = <#abc#>;
    
    [httpTool POST:@"imageUrl" parameters:params success:^(id  _Nonnull responseObject) {
        
        [self pieceTogetherPathWithImageUrl:responseObject[@"data"]];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

- (void)pieceTogetherPathWithImageUrl:(NSString *)imageUrl {
    NSArray *stringArr = [imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = stringArr.lastObject;

    [self downloadAdImageWithUrl:imageUrl imageName:imageName];
}

- (void)downloadAdImageWithUrl:(NSString *)imageUrl imageName:(NSString *)imageName {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage *image = [UIImage imageWithData:data];
        
        // 保存文件的名称
        NSString *filePath = [self getFilePathWithImageName:imageName];
        if ([UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES]) {
            XPLog(@"广告页保存成功");
            [self deleteOldImage];
            [kUserDefaults setValue:imageName forKey:adImageName];
            [kUserDefaults synchronize];
        } else {
            XPLog(@"广告页保存失败");
        }
    });
}

- (void)deleteOldImage {
    NSString *imageName = [kUserDefaults valueForKey:adImageName];
    if (imageName) {
        NSString *filePath = [self getFilePathWithImageName:imageName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:filePath error:nil];
    }
}

- (void)pushToAd {
    
}

@end

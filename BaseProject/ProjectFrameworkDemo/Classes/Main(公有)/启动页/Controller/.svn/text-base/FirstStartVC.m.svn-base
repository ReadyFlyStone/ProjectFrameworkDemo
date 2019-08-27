//
//  FirstStartVC.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 16/6/8.
//  Copyright © 2016年 xiaopao. All rights reserved.
//

#import "FirstStartVC.h"
#import "DWScrollPictures.h"
#import "HomeVC.h"

@interface FirstStartVC ()<DWScrollerPictureDelegate>

@property (strong, nonatomic) DWScrollPictures *features;

@end

@implementation FirstStartVC

- (DWScrollPictures *)features {
    
    if (!_features) {
        
        _features = [[DWScrollPictures alloc] init];
    }
    return _features;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNewFeatures];
}

- (void)setNewFeatures {
    //设置新特性图片
    NSArray *imageArr = @[@"NewFeature1",@"NewFeature2",@"NewFeature3"];
    [self.features dw_SetNewFeaturesView:self.view delegate:self imageName:imageArr pageImageView:^(UIView *pageImageView, int imageCount, int imageAllCount) {
        
        if (imageCount == imageAllCount) {
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kScreenW / 4, kScreenH - 80, kScreenW / 2, 43)];
            [button setTitle:@"立即进入" forState:UIControlStateNormal];            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = font(22);
            button.layer.cornerRadius = 3;
            button.layer.borderColor = [[UIColor whiteColor] CGColor];
            button.layer.borderWidth = 1;
            
            button.backgroundColor = [UIColor clearColor];
            [button addTarget:self action:@selector(joinBtnClick) forControlEvents:UIControlEventTouchUpInside];
            
            [pageImageView addSubview:button];
        }
    }];
}

- (void)joinBtnClick {
    //跳转到首页控制器
    XPLoginVC *loginVC = [[XPLoginVC alloc] init];
    RootNavigationController *nav = [[RootNavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:nav animated:YES completion:nil];
    //删除当前控制器
    [self removeFromParentViewController];
}

//- (void)dw_nowPageCount:(double)pageCount imageAllCount:(NSInteger)imageAllCount{
//    NSLog(@"%f",pageCount);
//    NSLog(@"%ld",imageAllCount);
//    
//    //最后一张新特性图片
//    if (pageCount > imageAllCount) {
//        [self joinBtnClick];
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

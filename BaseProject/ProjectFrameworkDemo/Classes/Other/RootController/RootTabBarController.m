//
//  CYLTabBarControllerConfig.m
//  CYLTabBarController
//
//  v1.16.0 Created by 微博@iOS程序犭袁 ( http://weibo.com/luohanchenyilong/ ) on 10/20/15.
//  Copyright © 2015 https://github.com/ChenYilong . All rights reserved.
//
#import "RootTabBarController.h"
#import <UIKit/UIKit.h>

//static CGFloat const CYLTabBarControllerHeight = 40.f;

//View Controllers
//// 分类
//#import "FWCategoryVC.h"
//// 购物车
//#import "FWShoppingCarVC.h"

@interface RootTabBarController ()<UITabBarControllerDelegate>

@end

@implementation RootTabBarController

- (instancetype)init {
    /**
     * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
     * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
     * 更推荐后一种做法。
     */
    UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
    UIOffset titlePositionAdjustment = UIOffsetMake(0, 0);
    if (self = [super initWithViewControllers:[self viewControllersForTabBar]
                            tabBarItemsAttributes:[self tabBarItemsAttributesForTabBar]
                                      imageInsets:imageInsets
                          titlePositionAdjustment:titlePositionAdjustment
                                          context:self.context
                    ]) {
//            [self customizeTabBarAppearance];
            self.delegate = self;
//            self.navigationController.navigationBar.hidden = YES;
        }
        return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    [self becomeFirstResponder];
}

- (NSArray *)viewControllersForTabBar {
    HomeVC *firstViewController = [[HomeVC alloc] init];
    RootNavigationController *firstNavigationController = [[RootNavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
//    FWCategoryVC *secondViewController = [[FWCategoryVC alloc] init];
//    RootNavigationController *secondNavigationController = [[RootNavigationController alloc]
//                                                    initWithRootViewController:secondViewController];
//
//    FWShoppingCarVC *thirdViewController = [[FWShoppingCarVC alloc] init];
//    RootNavigationController *thirdNavigationController = [[RootNavigationController alloc]
//                                                   initWithRootViewController:thirdViewController];
    
    UserCenterVC *fourthViewController = [[UserCenterVC alloc] init];
    RootNavigationController *fourthNavigationController = [[RootNavigationController alloc]
                                                    initWithRootViewController:fourthViewController];
    
  
    NSArray *viewControllers = @[
                                 firstNavigationController,
//                                 secondNavigationController,
//                                 thirdNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForTabBar {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"tab_home_nor",  /* NSString and UIImage are supported*/
                                                 CYLTabBarItemSelectedImage : @"tab_home_pre", /* NSString and UIImage are supported*/
//                                                 CYLTabBarItemImageInsets: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)],
//                                                 CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(0, 0)]
                                                 };
//    NSDictionary *secondTabBarItemsAttributes = @{
//                                                  CYLTabBarItemTitle : @"分类",
//                                                  CYLTabBarItemImage : @"home_icon_classification_default",
//                                                  CYLTabBarItemSelectedImage : [UIImage imageNamed:@"home_icon_classification_selected"],
//                                                  };
//    NSDictionary *thirdTabBarItemsAttributes = @{
//                                                 CYLTabBarItemTitle : @"购物车",
//                                                 CYLTabBarItemImage : @"home_icon_shopcart_default",
//                                                 CYLTabBarItemSelectedImage : [UIImage imageNamed:@"home_icon_shopcart_selected"],
//                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我的",
                                                  CYLTabBarItemImage : @"tab_my_nor",
                                                  CYLTabBarItemSelectedImage : @"tab_my_pre",
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
//                                       secondTabBarItemsAttributes,
//                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance {
    // Customize UITabBar height
    // 自定义 TabBar 高度
//    tabBarController.tabBarHeight = CYL_IS_IPHONE_X ? 65 : 40;
    
//    [self rootWindow].backgroundColor = [UIColor cyl_systemBackgroundColor];
    
//    // set the text color for unselected state
//    // 普通状态下的文字属性
//    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
//    normalAttrs[NSForegroundColorAttributeName] = RGBColor(170, 170, 170);
////
////    // set the text color for selected state
////    // 选中状态下的文字属性
//    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
//    selectedAttrs[NSForegroundColorAttributeName] = Main_Color;
////
////    // set the text Attributes
////    // 设置文字属性
//    UITabBarItem *tabBar = [UITabBarItem appearance];
//    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
//    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set background color
    // 设置 TabBar 背景
    // 半透明
//    [UITabBar appearance].translucent = YES;
    // [UITabBar appearance].barTintColor = [UIColor cyl_systemBackgroundColor];
    // [[UITabBar appearance] setBackgroundColor:[UIColor cyl_systemBackgroundColor]];
    
    
    //     [[UITabBar appearance] setBackgroundImage:[[self class] imageWithColor:[UIColor whiteColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, tabBarController.tabBarHeight ?: (CYL_IS_IPHONE_X ? 65 : 40))]];
    //    [[UITabBar appearance] setUnselectedItemTintColor:[UIColor systemGrayColor]];
    
    //Three way to deal with shadow 三种阴影处理方式：
    // NO.3, without shadow : use -[[CYLTabBarController hideTabBarShadowImageView] in CYLMainRootViewController.m
    // NO.2，using Image
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
//    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
//    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"TabBar_Bg_Shadow"]];
    // NO.1，using layer to add shadow. note:recommended. 推荐该方式，可以给PlusButton突出的部分也添加上阴影
//    tabBarController.tabBar.layer.shadowColor = [UIColor blackColor].CGColor;
//    tabBarController.tabBar.layer.shadowRadius = 15.0;
//    tabBarController.tabBar.layer.shadowOpacity = 0.2;
//    tabBarController.tabBar.layer.shadowOffset = CGSizeMake(0, 3);
//    tabBarController.tabBar.layer.masksToBounds = NO;
//    tabBarController.tabBar.clipsToBounds = NO;
}

/*
- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    CGFloat tabBarHeight = CYLTabBarControllerHeight;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor yellowColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize {
    CGFloat halfWidth = image.size.width/2;
    CGFloat halfHeight = image.size.height/2;
    UIImage *secondStrechImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(halfHeight, halfWidth, halfHeight, halfWidth) resizingMode:UIImageResizingModeStretch];
    return secondStrechImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
*/

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"🔴类名与方法名：%@（在第%@行），描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), @"");
}

#pragma mark - delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
//    if(!userManager.isLogined) {
//        UINavigationController *nav = (UINavigationController*)viewController;
//        UIViewController *vc = [nav.viewControllers firstObject];
//        if([vc isKindOfClass:FDOrderVC.class] || [vc isKindOfClass:UserCenterVC.class]) {
//            KPostNotification(KNotificationLoginStateChange, @NO);
//            return NO;
//        }
//    }
    return YES;
}

//- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
//    NSLog(@"🔴类名与方法名：%@（在第%@行），描述：control : %@ ,tabBarChildViewControllerIndex: %@, tabBarItemVisibleIndex : %@", @(__PRETTY_FUNCTION__), @(__LINE__), control, @(control.cyl_tabBarChildViewControllerIndex), @(control.cyl_tabBarItemVisibleIndex));
//    if ([control cyl_isTabButton]) {
//        //更改红标状态
//        if ([self.selectedViewController cyl_isShowBadge]) {
//            [self.selectedViewController cyl_clearBadge];
//        } else {
//            [self.selectedViewController cyl_showBadge];
//        }
//    }
//}

@end

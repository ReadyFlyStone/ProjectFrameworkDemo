//
//  NSObject+GetCurrentVC.m
//  Makepolo
//
//  Created by 周磊 on 2017/4/28.
//  Copyright © 2017年 Longing. All rights reserved.
//

#import "NSObject+GetCurrentVC.h"

@implementation NSObject (GetCurrentVC)

//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC  {
    
    UIViewController *result = nil;

    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)  {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)  {
            if (tmpWin.windowLevel == UIWindowLevelNormal)  {
                window = tmpWin;
                break;
            }
        }
    }

    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];

    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;

    if ([result isKindOfClass:[UINavigationController class]])  {
        UINavigationController *temp = (UINavigationController *)result;
        return temp.visibleViewController;
    }
    return result;
}

//- (UIViewController *)topViewController {
////    return self topViewControllerWithRootViewController:<#(UIViewController *)#>
//}
//
//- (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)viewController {
//    if (viewController == nil) {
//        
//        return nil;
//    }
//
//    if (viewController.presentedViewController != nil) {
//
//        return [self topViewControllerWithRootViewController:viewController.presentedViewController];
//    }
//    else if ([viewController isKindOfClass:[UITabBarController class]]) {
//
//        return [self topViewControllerWithRootViewController:[UITabBarController new].selectedViewController];
//    }
//    else if ([viewController isKindOfClass:[UINavigationController class]])  {
//
//        return [self topViewControllerWithRootViewController:[UINavigationController new].visibleViewController];
//    }
//    else {
//
//        return viewController;
//    }
//}

@end

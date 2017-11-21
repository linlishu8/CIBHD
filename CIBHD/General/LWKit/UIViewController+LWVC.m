//
//  UIViewController+LWVC.m
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/13.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import "UIViewController+LWVC.h"

@implementation UIViewController (LWVC)

+ (UIViewController *)findBestViewController:(UIViewController *)vc {
    if (vc.presentedViewController) {
        return [self findBestViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        UISplitViewController* svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0) {
            return [self findBestViewController:svc.viewControllers.lastObject];
        } else {
            return vc;
        }
        
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController* svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0) {
            return [self findBestViewController:svc.topViewController];
        } else {
            return vc;
        }
        
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController* svc = (UITabBarController *)vc;
        if (svc.viewControllers.count > 0) {
            return [self findBestViewController:svc.selectedViewController];
        } else {
            return vc;
        }
    } else {
        return vc;
    }
}

+ (UIViewController *)lw_currentViewController {
    UIViewController *viewController = [[UIApplication sharedApplication].delegate window].rootViewController;
    return [UIViewController findBestViewController:viewController];
}

+ (UINavigationController *)lw_currentNavigatonController {
    UIViewController * currentViewController =  [UIViewController lw_currentViewController];
    return currentViewController.navigationController;
}

- (void)lw_addChildController:(UIViewController *)childController intoView:(UIView *)view {
    [self addChildViewController:childController];
    [view addSubview:childController.view];
    [childController didMoveToParentViewController:self];
}

@end

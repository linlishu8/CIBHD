//
//  UIViewController+LWVC.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/13.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LWVC)

//找到当前视图控制器
+ (UIViewController *)lw_currentViewController;

//找到当前导航控制器
+ (UINavigationController *)lw_currentNavigatonController;

/**
 * 在当前视图控制器中添加子控制器，将子控制器的视图添加到 view 中
 *
 * @param childController 要添加的子控制器
 * @param view            要添加到的视图
 */
- (void)lw_addChildController:(UIViewController *)childController intoView:(UIView *)view;

@end

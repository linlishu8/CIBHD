//
//  WHMethods.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/13.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWMethods : UIViewController

//更改iOS状态栏的颜色
+ (void)lw_setStatusBarBackgroundColor:(UIColor *)color;

//为控制器添加背景图片
+ (void)lw_addBackgroundImageWithImageName:(NSString *)imageName forViewController:(UIViewController *)viewController;

//最大,最小,和,平均
+ (CGFloat)lw_maxNumberFromArray:(NSArray *)array;
+ (CGFloat)lw_minNumberFromArray:(NSArray *)array;
+ (CGFloat)lw_sumNumberFromArray:(NSArray *)array;
+ (CGFloat)lw_averageNumberFromArray:(NSArray *)array;

//可用硬件容量
+ (CGFloat)lw_usableHardDriveCapacity;
//硬件总容量
+ (CGFloat)lw_allHardDriveCapacity;

@end

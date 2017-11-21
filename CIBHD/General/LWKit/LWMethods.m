//
//  WHMethods.m
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/13.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import "LWMethods.h"

@interface LWMethods ()

@end

@implementation LWMethods

+ (void)lw_setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

+ (void)lw_addBackgroundImageWithImageName:(NSString *)imageName forViewController:(UIViewController *)viewController {
    //给控制器添加背景图片
    UIImage *oldImage = [UIImage imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(viewController.view.frame.size, NO, 0.0);
    [oldImage drawInRect:viewController.view.bounds];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    viewController.view.backgroundColor = [UIColor colorWithPatternImage:newImage];
}


+ (CGFloat)lw_maxNumberFromArray:(NSArray *)array {
    CGFloat max = 0;
    max =[[array valueForKeyPath:@"@max.floatValue"] floatValue];
    return max;
}

+ (CGFloat)lw_minNumberFromArray:(NSArray *)array {
    CGFloat min = 0;
    min =[[array valueForKeyPath:@"@min.floatValue"] floatValue];
    return min;
}

+ (CGFloat)lw_sumNumberFromArray:(NSArray *)array {
    CGFloat sum = 0;
    sum = [[array valueForKeyPath:@"@sum.floatValue"] floatValue];
    return sum;
}

+ (CGFloat)lw_averageNumberFromArray:(NSArray *)array {
    CGFloat avg = 0;
    avg = [[array valueForKeyPath:@"@avg.floatValue"] floatValue];
    return avg;
}

+ (CGFloat)lw_usableHardDriveCapacity {
    CGFloat usable = 0;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *attributes = [fileManager attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    usable = [attributes[NSFileSystemFreeSize] doubleValue] / powf(1024, 3);
    NSLog(@"可用%.2fG",[attributes[NSFileSystemFreeSize] doubleValue] / powf(1024, 3));
    return usable;
}

+ (CGFloat)lw_allHardDriveCapacity {
    CGFloat all = 0;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *attributes = [fileManager attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    all = [attributes[NSFileSystemSize] doubleValue] / (powf(1024, 3));
    NSLog(@"容量%.2fG",[attributes[NSFileSystemSize] doubleValue] / (powf(1024, 3)));
    return all;
}

@end

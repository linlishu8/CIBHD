//
//  UILabel+LWLabel.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/12.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LWLabel)

+ (instancetype)label;
- (UILabel *(^)(NSString *))normalText;
- (UILabel *(^)(UIFont *))normalFont;
- (UILabel *(^)(UIColor *))normalColor;
- (UILabel *(^)(NSTextAlignment))normalTextAlignment;
- (UILabel *(^)(UIColor *))normalBackgroundColor;

/**
 *  设置字间距
 */
- (void)setColumnSpace:(CGFloat)columnSpace;

/**
 *  设置行距
 */
- (void)setRowSpace:(CGFloat)rowSpace;

@end

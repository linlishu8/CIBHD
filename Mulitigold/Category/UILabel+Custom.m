//
//  UILabel+Custom.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/30.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "UILabel+Custom.h"

@implementation UILabel (Custom)

+ (UILabel *)lableFrame:(CGRect)rect text:(NSString *)text
{
    UILabel *label = [[self alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor whiteColor];
    label.text = text;
    return label;
}

+ (UILabel *)lableFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font
{
    return [[self lableFrame:rect text:text] labelBindFont:font];
}

+ (UILabel *)lableFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color
{
    return [[self lableFrame:rect text:text font:font] labelBindTextColor:color];
}

- (UILabel *)labelBindFont:(UIFont *)font
{
    [self setFont:font];
    return self;
}

- (UILabel *)labelBindTextColor:(UIColor *)color
{
    [self setTextColor:color];
    return self;
}

@end

//
//  UIView+Custom.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/30.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "UIView+Custom.h"
#import <objc/runtime.h>
static const void *UIButtonBlockKey = &UIButtonBlockKey;

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

@implementation UIButton (Custom)

-(void)addActionHandler:(TouchedBlock)touchHandler{
    objc_setAssociatedObject(self, UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)actionTouched:(UIButton *)btn{
    TouchedBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}

+ (UIButton *)buttonImage:(NSString *)backImage
{
    UIButton *button = [[self alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
    return button;
}

+ (UIButton *)buttonText:(NSString *)text
{
    UIButton *button = [[self alloc] init];
    [button setTitle:text forState:UIControlStateNormal];
    return button;
}

+ (UIButton *)buttonText:(NSString *)text font:(UIFont *)font
{
    return [[self buttonText:text] buttonBindFont:font];
}

+ (UIButton *)buttonText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color
{
    return [[self buttonText:text font:font] buttonBindTextColor:color];
}

- (UIButton *)buttonBindFont:(UIFont *)font
{
    [self.titleLabel setFont:font];
    return self;
}

- (UIButton *)buttonBindTextColor:(UIColor *)color
{
    [self.titleLabel setTextColor:color];
    return self;
}

@end

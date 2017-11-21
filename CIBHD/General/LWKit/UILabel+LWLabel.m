//
//  UILabel+LWLabel.m
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/12.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import "UILabel+LWLabel.h"
#import <CoreText/CoreText.h>

@implementation UILabel (LWLabel)

+ (instancetype)label {
    return [[self alloc] init];
}

- (UILabel *(^)(NSString *))normalText {
    return ^(NSString *text) {
        [self setText:text];
        return self;
    };
}

- (UILabel *(^)(UIFont *))normalFont {
    return ^(UIFont *font) {
        [self setFont:font];
        return self;
    };
}

- (UILabel *(^)(UIColor *))normalColor {
    return ^(UIColor *color) {
        [self setTextColor:color];
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))normalTextAlignment {
    return ^(NSTextAlignment normalTextAlignment) {
        [self setTextAlignment:normalTextAlignment];
        return self;
    };
}

- (UILabel *(^)(UIColor *))normalBackgroundColor {
    return ^(UIColor *color) {
        [self setBackgroundColor:color];
        return self;
    };
}

- (void)setColumnSpace:(CGFloat)columnSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整间距
    [attributedString addAttribute:(__bridge NSString *)kCTKernAttributeName value:@(columnSpace) range:NSMakeRange(0, [attributedString length])];
    self.attributedText = attributedString;
}

- (void)setRowSpace:(CGFloat)rowSpace {
    self.numberOfLines = 0;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = rowSpace;
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}

@end

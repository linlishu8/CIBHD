//
//  UIView+FreeBorder.h
//  Mulitigold
//
//  Created by 动感超人 on 16/6/14.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BorderTypeTop,
    BorderTypeLeft,
    BorderTypeRight,
    BorderTypeBottom
} BorderType;

@interface UIView (FreeBorder)

- (void)addBorderWithColor:(UIColor *)color size:(CGFloat)size borderTypes:(NSArray *)types;

- (void)addBorderLayerWithColor:(UIColor *)color size:(CGFloat)size borderType:(BorderType)boderType;

@end

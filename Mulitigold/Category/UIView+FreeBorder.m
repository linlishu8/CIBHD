//
//  UIView+FreeBorder.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/14.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "UIView+FreeBorder.h"

@implementation UIView (FreeBorder)

- (void)addBorderWithColor:(UIColor *)color size:(CGFloat)size borderTypes:(NSArray *)types{
    for (int i = 0 ; i < types.count; i ++) {
        [self addBorderLayerWithColor:color size:size borderType:[types[i] integerValue]];
    }
}

- (void)addBorderLayerWithColor:(UIColor *)color size:(CGFloat)size borderType:(BorderType)boderType{
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
    [self layoutIfNeeded];
    
    switch (boderType) {
        case BorderTypeTop:
            layer.frame = CGRectMake(0, 0, self.frame.size.width, size);
            break;
        case BorderTypeLeft:
            layer.frame = CGRectMake(0, 0, size, self.frame.size.height);
            break;
        case BorderTypeBottom:
            layer.frame = CGRectMake(0, self.frame.size.height - size, self.frame.size.width, size);
            break;
        case BorderTypeRight:
            layer.frame = CGRectMake(self.frame.size.width - size, 0, size, self.frame.size.height);
            break;
        default:
            break;
    }
    
}



@end

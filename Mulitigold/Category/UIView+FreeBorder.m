//
//  UIView+FreeBorder.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/14.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "UIView+FreeBorder.h"

@implementation UIView (FreeBorder)

- (void)addBorderWithColor:(UIColor *)color size:(CGFloat)size borderTypes:(NSArray *)types
{
    for (int i = 0 ; i < types.count; i ++) {
        [self addBorderLayerWithColor:color size:size borderType:[types[i] integerValue]];
    }
}


- (void)addBorderLayerWithColor:(UIColor *)color size:(CGFloat)size borderType:(BorderType)boderType
{
    UIView *lineView = [UIView new];
    [lineView setBackgroundColor:color];
    [self addSubview:lineView];
    
    @weakify(self);
    switch (boderType) {
        case BorderTypeTop:
        {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.left.and.top.and.bottom.equalTo(self);
                make.height.equalTo(@(size));
            }];
        }
            break;
        case BorderTypeLeft:
        {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.left.and.top.and.bottom.equalTo(self);
                make.width.equalTo(@(size));
            }];
        }
            break;
        case BorderTypeBottom:
        {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.left.and.right.and.bottom.equalTo(self);
                make.height.equalTo(@(size));
            }];
        }
            break;
        case BorderTypeRight:
        {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.top.and.right.and.bottom.equalTo(self);
                make.width.equalTo(@(size));
            }];
        }
            break;
        default:
            break;
    }
}

@end

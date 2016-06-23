//
//  BaseRefreshHeader.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/21.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "BaseRefreshHeader.h"

@interface BaseRefreshHeader()

@property (weak, nonatomic) UIImageView *logo;

@end

@implementation BaseRefreshHeader

#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MG_Refresh_Logo"]];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:logo];
    self.logo = logo;
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    self.logo.bounds = CGRectMake(0, 0, 88, 26);
    self.logo.center = CGPointMake(self.mj_w * 0.5, - self.logo.mj_h);
}

@end

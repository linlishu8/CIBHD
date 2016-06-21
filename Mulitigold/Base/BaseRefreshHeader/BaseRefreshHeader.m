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
@property (weak, nonatomic) UILabel *label;

@end

@implementation BaseRefreshHeader

#pragma mark 在这里做一些初始化配置
- (void)prepare
{
    [super prepare];
    self.mj_h = 50;
    
    UILabel *label = [UILabel lableFrame:CGRectZero
                                    text:@""
                                    font:SYSTEMFONT(12)
                               textColor:COLOR999999
                           textAlignment:NSTextAlignmentCenter];
    [self addSubview:label];
    self.label = label;
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MG_Refresh_Logo"]];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:logo];
    self.logo = logo;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.label.frame = self.bounds;
    
    self.logo.bounds = CGRectMake(0, 0, WIDTH_LFL(88), HEIGHT_LFL(26));
    self.logo.center = CGPointMake(self.mj_w * 0.5, - self.logo.mj_h);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.label.text = @"下拉即可刷新...";
            break;
        case MJRefreshStatePulling:
            self.label.text = @"释放即可刷新...";
            break;
        case MJRefreshStateRefreshing:
            self.label.text = @"加载中...";
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
}

@end

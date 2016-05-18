//
//  BaseNavBarHiddenController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/18.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "BaseNavBarHiddenController.h"

@interface BaseNavBarHiddenController ()

@property (nonatomic, assign) NSInteger hidenControlOptions;
@property (nonatomic, assign) NSInteger scrolOffsetY;
@property (nonatomic, assign) CGFloat alpha;
@property (nonatomic, strong) UIScrollView * keyScrollView;
@property (nonatomic, strong) UIImage * navBarBackgroundImage;

@end

@implementation BaseNavBarHiddenController

- (void)setKeyScrollView:(UIScrollView * )keyScrollView scrolOffsetY:(CGFloat)scrolOffsetY options:(HYHidenControlOptions)options
{
    
    _keyScrollView = keyScrollView;
    _hidenControlOptions = options;
    _scrolOffsetY = scrolOffsetY;
    
    [_keyScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    CGPoint point = _keyScrollView.contentOffset;
    _alpha =  point.y/_scrolOffsetY;
    _alpha = (_alpha <= 0)?0:_alpha;
    _alpha = (_alpha >= 1)?1:_alpha;
    
    //设置导航条上的标签是否跟着透明
    self.navigationItem.leftBarButtonItem.customView.alpha = _hidenControlOptions & 1?_alpha:1;
    
    self.navigationItem.titleView.alpha = _hidenControlOptions >> 1 & 1 ?_alpha:1;
    self.navigationItem.rightBarButtonItem.customView.alpha = _hidenControlOptions >> 2 & 1?_alpha:1;
    
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:_alpha];
}

- (void)dealloc{
    
    [_keyScrollView removeObserver:self forKeyPath:@"contentOffset" context:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  MGNavBarHiddenController.m
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/23.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "MGNavBarHiddenController.h"

@interface MGNavBarHiddenController ()

@end

@implementation MGNavBarHiddenController {
    CGFloat _alpha;
    NSInteger _hidenControlOptions;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _alpha = -100;
}

- (void)setKeyScrollView:(UIScrollView * )keyScrollView
            scrolOffsetY:(CGFloat)scrolOffsetY
                 options:(MGHidenControlOptions)options {
    [RACObserve(keyScrollView, contentOffset) subscribeNext:^(NSValue *point) {
        if (self.navigationController.navigationBar.hidden) {
            [self.navigationController.navigationBar setHidden:NO];
        }
        
        CGFloat newAlpha = point.CGPointValue.y/scrolOffsetY;
        newAlpha = (newAlpha <= 0)?0:newAlpha;
        newAlpha = (newAlpha >= 1)?1:newAlpha;
        
        if (newAlpha == _alpha) return;
        _alpha = newAlpha;
        
        //设置导航条上的标签是否跟着透明
        [self updateNavigationBarWithAlpha:_alpha];
    }];
}

- (void)updateNavigationBarWithAlpha:(CGFloat)alpha {
    //设置导航条上的标签是否跟着透明
    self.navigationItem.leftBarButtonItem.customView.alpha = _hidenControlOptions & 1?alpha:1;
    
    self.navigationItem.titleView.alpha = _hidenControlOptions >> 1 & 1 ?alpha:1;
    self.navigationItem.rightBarButtonItem.customView.alpha = _hidenControlOptions >> 2 & 1?alpha:1;
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:alpha];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

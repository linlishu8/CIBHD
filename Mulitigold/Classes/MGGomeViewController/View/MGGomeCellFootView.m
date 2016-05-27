//
//  MGGomeCellFootView.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/27.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomeCellFootView.h"

const CGFloat MGRefreshSlowAnimationDuration = 0.6;

@interface MGGomeCellFootView ()

@property (nonatomic, strong) YABaseDataEngine *gomeDataEngine;

@end

@implementation MGGomeCellFootView

+ (MGGomeCellFootView *)setupFootView
{
    return [[MGGomeCellFootView alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIButton *refreshButton = [[UIButton alloc] init];
        [refreshButton setBackgroundImage:GetImage(@"MGGome_RefreshButton") forState:UIControlStateNormal];
        [refreshButton addTarget:self action:@selector(refreshControl:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:refreshButton];
        
        [refreshButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(@(HEIGHT_LFL(20)));
        }];
    }
    return self;
}

- (void)refreshControl:(UIButton *)sender
{
    [self.gomeDataEngine cancelRequest];
    
    @weakify(self);
    self.gomeDataEngine = [MGGomeDataEngine control:self params:@{} path:GoldRateAndSysTime addressType:YAAddressManagerType2 requestType:YAAPIManagerRequestTypePost complete:^(id data, NSError *error) {
        @strongify(self);
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        } else {
            NSLog(@"%@",data);
        }
    }];
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = MGRefreshSlowAnimationDuration;
    rotationAnimation.cumulative = YES;
    
    [sender.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

@end

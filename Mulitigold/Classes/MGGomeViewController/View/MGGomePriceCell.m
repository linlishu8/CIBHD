//
//  MGGomePriceCell.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/20.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomePriceCell.h"
#import "BannerDataModel.h"

const CGFloat MGRefreshSlowAnimationDuration = 0.6;

@interface MGGomePriceCell ()

@property (nonatomic, strong) YABaseDataEngine *gomeDataEngine;
@property (nonatomic, strong) UILabel *priceLabel;

@end

@implementation MGGomePriceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    UILabel *fontLabel = [UILabel lableFrame:CGRectZero
                                        text:@"最新金价"
                                        font:SYSTEMFONT(10.0)
                                   textColor:COLOR333333];
    [self addSubview:fontLabel];
    
    self.priceLabel = [UILabel lableFrame:CGRectZero
                                     text:@"---.--元/g"
                                     font:SYSTEMFONT(26.0)
                                textColor:COLOR333333];
    [self addSubview:self.priceLabel];
    
    UIButton *refreshButton = [[UIButton alloc] init];
    [refreshButton setBackgroundImage:GetImage(@"MGGome_RefreshButton")
                             forState:UIControlStateNormal];
    
    [refreshButton addTarget:self
                      action:@selector(refreshControl:)
            forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:refreshButton];
    
    UIButton *buyButton = [[UIButton alloc] init];
    [buyButton setTitle:@"买入黄金" forState:UIControlStateNormal];
    [buyButton setTitleColor:HEXCOLOR(0xff6336) forState:UIControlStateNormal];
    [buyButton.titleLabel setFont:SYSTEMFONT(16.0)];
    buyButton.layer.masksToBounds = YES;
    buyButton.layer.cornerRadius = 4;
    buyButton.layer.borderColor = HEXCOLOR(0xff6336).CGColor;
    buyButton.layer.borderWidth = 1;
    [self addSubview:buyButton];
    
    @weakify(self);
    [fontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(HEIGHT_LFL(150), HEIGHT_LFL(15)));
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.width.equalTo(fontLabel);
        make.top.equalTo(fontLabel.mas_bottom);
        make.height.equalTo(@(HEIGHT_LFL(30)));
    }];
    
    [refreshButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.width.and.height.equalTo(@(HEIGHT_LFL(20)));
        make.left.equalTo(fontLabel.mas_right);
        make.bottom.equalTo(self).with.offset(-11);
    }];
    
    [buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(refreshButton.mas_right).with.offset(25);
        make.top.equalTo(self).with.offset(13);
        make.bottom.right.equalTo(self).width.offset(-13);
    }];
    
    [self refreshControl:refreshButton];
}

- (void)refreshControl:(UIButton *)sender
{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = MGRefreshSlowAnimationDuration;
    rotationAnimation.cumulative = YES;
    
    [sender.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    [self startHttpRequest];
}

- (void)startHttpRequest
{
    [self.gomeDataEngine cancelRequest];
    
    @weakify(self);
    self.gomeDataEngine = [MGGomeDataEngine control:self params:@{} path:GoldRateAndSysTime addressType:YAAddressManagerType2 requestType:YAAPIManagerRequestTypePost complete:^(id data, NSError *error) {
        @strongify(self);
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        } else {
            NSError* error;
            BannerFootModel *model = [MTLJSONAdapter modelOfClass:[BannerFootModel class] fromJSONDictionary:data error:&error];
            NSLog(@"model.goldRate:%@",[NSString stringWithFormat:@"%.2f元/g",model.goldRate]);
            if(error){
                NSLog(@"error:%@, Info:%@",error,error.userInfo);
            }
            self.priceLabel.text = [NSString stringWithFormat:@"%.2f元/g",model.goldRate];
        }
    }];
}

@end

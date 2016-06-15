//
//  MGGomeMenuCell.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/24.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomeMenuCell.h"
#import "ImageCenterButton.h"

@interface MGGomeMenuCell ()

@property (nonatomic, copy) void (^clickItemBlock)(NSInteger);

@end

@implementation MGGomeMenuCell

- (void)setButtons:(NSArray *)buttons clickItemBlock:(void (^)(NSInteger))clickItemBlock
{
    for (NSUInteger i = 0; i < [buttons count]; i++) {
        ImageCenterButton *button = [self addButtons:i title:buttons[i]];
        [button setTag:10+i];
        @weakify(self);
        [button addActionHandler:^(NSInteger tag) {
            @strongify(self);
            self.clickItemBlock(tag);
        }];
        [self.contentView addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(50));
            make.height.equalTo(@(70));
            make.centerY.equalTo(self.contentView.mas_centerY).multipliedBy(0.5+i/4);
            make.centerX.equalTo(self.contentView.mas_centerX).multipliedBy(0.25+(CGFloat)(i%4)/2);
        }];
    }
    self.clickItemBlock = clickItemBlock;
}

- (ImageCenterButton *)addButtons:(NSUInteger)index title:(NSString *)title
{
    ImageCenterButton *button = [[ImageCenterButton alloc] init];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"MGGome_Menu_Button%ld",(long)index]] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:DEFINE_LITTLE forState:UIControlStateNormal];
    button.titleLabel.font = SYSTEMFONT(12.0);
    button.imageIsRound = YES;
    button.imageTextSpace = 6.0;
    button.imageViewMaxSize = CGSizeMake(HEIGHT_LFL(40), HEIGHT_LFL(40));
    return button;
}

@end

//
//  MGGomeMenuCell.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/24.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomeMenuCell.h"

static const NSUInteger ITEM_COUNT = 4;

@interface MGGomeMenuCell ()

@property (nonatomic, copy) void (^clickItemBlock)(NSInteger);

@end

@implementation MGGomeMenuCell

- (void)setButtons:(NSArray *)buttons clickItemBlock:(void (^)(NSInteger))clickItemBlock
{
    for (NSUInteger i = 0; i < [buttons count]; i++) {
        UIButton *button = [self addButtons:i title:buttons[i]];
        [button setTag:10+i];
        @weakify(self);
        [button addActionHandler:^(NSInteger tag) {
            @strongify(self);
            self.clickItemBlock(tag);
        }];
        [self.contentView addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(WIDTH_LFL(50)));
            make.height.equalTo(@(HEIGHT_LFL(70)));
            make.centerY.equalTo(self.contentView.mas_centerY).multipliedBy(0.5+i/ITEM_COUNT);
            make.centerX.equalTo(self.contentView.mas_centerX).multipliedBy(0.25+(CGFloat)(i%ITEM_COUNT)/2);
        }];
    }
    self.clickItemBlock = clickItemBlock;
}

- (UIButton *)addButtons:(NSUInteger)index title:(NSString *)title
{
    UIButton *button = [UIButton ImageCenterButton:[NSString stringWithFormat:@"MGGome_Menu_Button%ld",(long)index] title:title fontSize:12.0 textColor:COLOR999999];
    return button;
}

@end

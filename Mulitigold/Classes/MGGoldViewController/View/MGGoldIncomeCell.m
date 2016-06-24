//
//  MGGoldIncomeCell.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/23.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGoldIncomeCell.h"

@interface MGGoldIncomeCell ()

@property (nonatomic, strong) UILabel *inrateLabel;

@end


@implementation MGGoldIncomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *titleLabel = [UILabel lableFrame:CGRectZero text:@"积存金" font:BOLDSYSTEMFONT(16.0) textColor:COLOR333333];
        [self.contentView addSubview:titleLabel];
        
        UIImageView *iconView = [UIImageView new];
        [iconView setImage:[UIImage imageNamed:@"MG_GoldIncome_icon"]];
        [self.contentView addSubview:iconView];
        
        UILabel *fontLabel = [UILabel lableFrame:CGRectZero text:@"相当于年化收益" font:BOLDSYSTEMFONT(10.0) textColor:COLOR999999];
        [self.contentView addSubview:fontLabel];
        
        self.inrateLabel = [UILabel lableFrame:CGRectZero text:@"-.--%" font:BOLDSYSTEMFONT(24.0) textColor:COLORff6336];
        [self.contentView addSubview:self.inrateLabel];
        
        UIImageView *buttonView = [UIImageView new];
        [buttonView setImage:[UIImage imageNamed:@"MG_GoldIncome_button"]];
        [self.contentView addSubview:buttonView];
        
        @weakify(self);
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.and.right.equalTo(self.contentView).offset(15.0);
            make.top.equalTo(self.contentView).offset(6.0);
            make.height.equalTo(@(HEIGHT_LFL(31.0)));
        }];
        
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLabel);
            make.top.equalTo(titleLabel.mas_bottom);
            make.width.and.height.equalTo(@(WIDTH_LFL(34.0)));
        }];
        
        [fontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iconView.mas_right).offset(10.0);
            make.top.equalTo(iconView);
            make.width.equalTo(@(WIDTH_LFL(100.0)));
            make.height.equalTo(@(HEIGHT_LFL(10.0)));
        }];
        
        [self.inrateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(fontLabel);
            make.top.equalTo(fontLabel.mas_bottom);
            make.width.equalTo(fontLabel);
            make.baseline.equalTo(iconView.mas_baseline);
        }];
        
        [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.equalTo(self.contentView).offset(-15.0);
            make.width.equalTo(@(WIDTH_LFL(110.0)));
            make.height.equalTo(@(HEIGHT_LFL(34.0)));
            make.baseline.equalTo(iconView.mas_baseline);
        }];
        
        [self.contentView addBorderLayerWithColor:COLORf4f4f4 size:15 borderType:BorderTypeBottom];
    }
    return self;
}

- (void)setIncomeModel:(MGIncomeModel *)incomeModel
{
    self.inrateLabel.text = [NSString stringWithFormat:@"%.2f%@",[incomeModel.inrate floatValue] * 100,@"%"];
}

@end

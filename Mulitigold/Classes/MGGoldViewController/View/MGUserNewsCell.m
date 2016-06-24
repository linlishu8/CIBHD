//
//  MGUserNewsCell.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/24.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGUserNewsCell.h"

@interface MGUserNewsCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *codeLabel;

@property (nonatomic, strong) UILabel *inrateLabel;//年收益
@property (nonatomic, strong) UILabel *timeLimitLabel;//固定周期
@property (nonatomic, strong) UILabel *balanceLabel;//已售百分比

@end

@implementation MGUserNewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [UILabel lableFrame:CGRectZero text:@"" font:SYSTEMFONT(18.0) textColor:COLOR333333];
        [self.contentView addSubview:self.titleLabel];
        
        UIImageView *adMemo = [UIImageView new];
        [adMemo setImage:[UIImage imageNamed:@"MG_GoldIncome_adMemo"]];
        [self.contentView addSubview:adMemo];
        
        UILabel *buttonLabel = [UILabel lableFrame:CGRectZero text:@"立即投资 >" font:SYSTEMFONT(15.0) textColor:COLORff6336 textAlignment:NSTextAlignmentRight];
        [self.contentView addSubview:buttonLabel];
        
        self.codeLabel = [UILabel lableFrame:CGRectZero text:@"" font:SYSTEMFONT(10.0) textColor:COLOR999999];
        [self.contentView addSubview:self.codeLabel];
        
        ///////////////////////////////
        
        self.inrateLabel = [UILabel lableFrame:CGRectZero text:@"" font:SYSTEMFONT(28.0) textColor:COLORff6336];
        [self.contentView addSubview:self.inrateLabel];
        
        self.timeLimitLabel = [UILabel lableFrame:CGRectZero text:@"" font:SYSTEMFONT(20.0) textColor:COLOR333333 textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:self.timeLimitLabel];
        
        self.balanceLabel = [UILabel lableFrame:CGRectZero text:@"" font:SYSTEMFONT(20.0) textColor:COLOR1f81c2 textAlignment:NSTextAlignmentRight];
        [self.contentView addSubview:self.balanceLabel];
        
        
        @weakify(self);
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(10);
            make.height.equalTo(@(HEIGHT_LFL(28)));
        }];
        
        [adMemo mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.width.equalTo(@(WIDTH_LFL(48)));
            make.height.equalTo(@(HEIGHT_LFL(21)));
        }];
        
        [buttonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.equalTo(adMemo);
            make.right.equalTo(self.titleLabel);
            make.top.equalTo(adMemo);
            make.height.equalTo(@(HEIGHT_LFL(21)));
        }];
        
        [self.codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.and.right.equalTo(self.titleLabel);
            make.top.equalTo(adMemo.mas_bottom);
            make.height.equalTo(@(HEIGHT_LFL(24)));
        }];
        
        ///////////////////////////////
        
        [self.inrateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.codeLabel.mas_bottom).offset(12);
            make.width.equalTo(self.contentView).offset(-10).dividedBy(3);
            make.height.equalTo(@(HEIGHT_LFL(30)));
        }];
        
        [self.timeLimitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.equalTo(self.inrateLabel.mas_right);
            make.top.and.width.and.height.equalTo(self.inrateLabel);
        }];
        
        [self.balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.equalTo(self.timeLimitLabel.mas_right);
            make.top.and.width.and.height.equalTo(self.inrateLabel);
        }];
        
        [self.codeLabel addBorderLayerWithColor:COLORf4f4f4 size:1 borderType:BorderTypeBottom];
        
        [self.contentView addBorderLayerWithColor:COLORf4f4f4 size:15 borderType:BorderTypeBottom];
    }
    return self;
}

- (void)setNewsModel:(MGForUseNewModel *)newsModel
{
    self.titleLabel.text = newsModel.lcPrdName;
    self.codeLabel.text = [NSString stringWithFormat:@"产品编号%@",newsModel.lcPrdCode];
    self.inrateLabel.text = [NSString stringWithFormat:@"%.2f%@",[newsModel.inrate floatValue] * 100,@"%"];
    self.timeLimitLabel.text = [NSString stringWithFormat:@"%ld天",(long)[newsModel.timeLimit integerValue]];
    self.balanceLabel.text = [NSString stringWithFormat:@"%.2f%@",(1 - [newsModel.balance floatValue]) * 100,@"%"];
}

@end

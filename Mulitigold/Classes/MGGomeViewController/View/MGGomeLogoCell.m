//
//  MGGomeLogoCell.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/20.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomeLogoCell.h"

@implementation MGGomeLogoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *imageView = [UIImageView new];
        [imageView setImage:[UIImage imageNamed:@"MG_Home_Logo"]];
        [self.contentView addSubview:imageView];
        
        @weakify(self);
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}

@end

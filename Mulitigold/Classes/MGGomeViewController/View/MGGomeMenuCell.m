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
    NSInteger i = 0;
    for (NSString *title in buttons) {
        ImageCenterButton *button = [self addButtons:CGRectMake(i%4*Main_Screen_Width/4, HEIGHT_LFL(12)+HEIGHT_LFL(70)*(i/4), Main_Screen_Width/4, HEIGHT_LFL(70)) image:[NSString stringWithFormat:@"MGGome_Menu_Button%ld",(long)i] title:title];
        button.tag = i+10;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        i ++;
    }
    self.clickItemBlock = clickItemBlock;
}

- (ImageCenterButton *)addButtons:(CGRect)frame image:(NSString *)image title:(NSString *)title
{
    ImageCenterButton *button = [[ImageCenterButton alloc] init];
    [button setFrame:frame];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:DEFINE_LITTLE forState:UIControlStateNormal];
    button.titleLabel.font = SYSTEMFONT(12.0);
    button.imageIsRound = YES;
    button.imageTextSpace = 6.0;
    button.imageViewMaxSize = CGSizeMake(HEIGHT_LFL(40), HEIGHT_LFL(40));
    return button;
}

- (void)buttonAction:(UIButton *)sender
{
    self.clickItemBlock(sender.tag);
}

@end

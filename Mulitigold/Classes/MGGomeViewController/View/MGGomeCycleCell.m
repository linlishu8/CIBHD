//
//  MGGomeCycleCell.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/24.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomeCycleCell.h"
#import "BannerDataModel.h"

@interface MGGomeCycleCell ()

@property(nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation MGGomeCycleCell

- (void)setBannerItems:(NSArray *)bannerItems
{
    NSMutableArray *items = [NSMutableArray array];
    
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, Main_Screen_Width, WIDTH_LFL(150)) delegate:nil placeholderImage:[UIImage imageNamed:@"banner_normal"]];
    self.cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    self.cycleScrollView.pageControlDotSize = CGSizeMake(8, 8);
    self.cycleScrollView.autoScrollTimeInterval = 5.0;
    [self.contentView addSubview:self.cycleScrollView];
    
    for (BannerDataModel *model in bannerItems) {
        [items addObject:model.imgUrl];
    }
    self.cycleScrollView.imageURLStringsGroup = items;
}

- (void)setDelegate:(id<SDCycleScrollViewDelegate>)delegate
{
    self.cycleScrollView.delegate = delegate;
}

@end

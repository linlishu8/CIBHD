//
//  BaseTableView.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/24.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "BaseTableView.h"
#import "BaseRefreshHeader.h"
#import "ReachabilityTools.h"

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        [self setSeparatorColor:[UIColor clearColor]];
        [self setBackgroundColor:COLORf4f4f4];
        self.tableDelegate = [[ACTableViewDelegte alloc] init];
        self.delegate = self.tableDelegate;
        self.dataSource = self.tableDelegate;
    }
    return self;
}

- (void)addTableViewRefreshHeader:(id)target selector:(SEL)selector
{
    BaseRefreshHeader *header = [BaseRefreshHeader headerWithRefreshingTarget:target refreshingAction:selector];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 马上进入刷新状态
    if ([ReachabilityTools sharedManager].isConnect) {
        [header beginRefreshing];
    }
    
    self.mj_header = header;
}

- (void)addTableViewRefreshFooter:(id)target selector:(SEL)selector
{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:selector];
    
    // 设置footer
    self.mj_footer = footer;
}


@end

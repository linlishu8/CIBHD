//
//  LWTableViewModel.h
//  TestProject
//
//  Created by 动感超人 on 2017/11/9.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import "LWViewModel.h"

@interface LWTableViewModel : LWViewModel

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger perPage;

@property (nonatomic, assign) BOOL shouldPullToRefresh;//是否添加下拉刷新
@property (nonatomic, assign) BOOL shouldCellSeparatorStyleNone;//是否清除cell横线
@property (nonatomic, assign) BOOL shouldInfiniteScrolling;//是否添加上拉更多

@property (nonatomic, strong) RACCommand *didSelectCommand;
@property (nonatomic, strong, readonly) RACCommand *requestRemoteDataCommand;

- (id)fetchLocalData;

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;

@end

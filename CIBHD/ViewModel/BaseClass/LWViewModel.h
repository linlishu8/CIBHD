//
//  LWViewModel.h
//  TestProject
//
//  Created by 动感超人 on 2017/11/8.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LWViewModelServices;

@interface LWViewModel : NSObject

- (instancetype)initWithServices:(id<LWViewModelServices>)services
                          params:(id)params;

@property (nonatomic, strong, readonly) id<LWViewModelServices> services;

@property (nonatomic, copy, readonly) id params;

@property (nonatomic, strong, readonly) RACSubject *errors;

@property (nonatomic, assign) BOOL shouldRequestRemoteDataOnViewDidLoad;
@property (nonatomic, assign) BOOL shouldLeftBarButtonItemCommand;//返回

- (void)initialize;

@end

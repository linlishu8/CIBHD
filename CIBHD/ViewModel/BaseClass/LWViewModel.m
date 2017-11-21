//
//  LWViewModel.m
//  TestProject
//
//  Created by 动感超人 on 2017/11/8.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import "LWViewModel.h"

@interface LWViewModel ()

@property (nonatomic, strong, readwrite) id<LWViewModelServices> services;
@property (nonatomic, copy, readwrite) id params;
@property (nonatomic, strong, readwrite) RACSubject *errors;

@end

@implementation LWViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    LWViewModel *viewModel = [super allocWithZone:zone];
    
    @weakify(viewModel)
    [[viewModel
      rac_signalForSelector:@selector(initWithServices:params:)]
     subscribeNext:^(id x) {
         @strongify(viewModel)
         [viewModel initialize];
     }];
    
    return viewModel;
}

- (instancetype)initWithServices:(id<LWViewModelServices>)services
                          params:(id)params {
    self = [super init];
    if (self) {
        self.shouldRequestRemoteDataOnViewDidLoad = NO;
        self.services = services;
        self.params   = params;
    }
    return self;
}

- (RACSubject *)errors {
    if (!_errors) _errors = [RACSubject subject];
    return _errors;
}

- (void)initialize {
}

@end

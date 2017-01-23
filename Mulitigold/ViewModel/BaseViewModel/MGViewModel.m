//
//  MGViewModel.m
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/22.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "MGViewModel.h"

@implementation MGViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    MGViewModel *viewModel = [super allocWithZone:zone];
    
    @weakify(viewModel)
    [[viewModel
      rac_signalForSelector:@selector(init)]
    	subscribeNext:^(id x) {
            @strongify(viewModel)
            [viewModel initialize];
        }];
    
    return viewModel;
}

- (void)initialize {}

@end

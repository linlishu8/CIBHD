//
//  MGHomepageViewModel.m
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/22.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "MGHomepageViewModel.h"

@interface MGHomepageViewModel ()

@property (nonatomic, strong, readwrite) MGGoldViewModel *goldViewModel;

@end

@implementation MGHomepageViewModel

- (void)initialize {
    [super initialize];
    
    self.goldViewModel = [[MGGoldViewModel alloc] init];
}

@end

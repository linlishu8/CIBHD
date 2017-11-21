//
//  LWViewModelServicesImpl.m
//  TestProject
//
//  Created by 动感超人 on 2017/11/8.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import "LWViewModelServicesImpl.h"

@implementation LWViewModelServicesImpl

@synthesize user = _user;

- (LWUser *)user {
    if (!_user) {
        _user = [[LWUser alloc] init];
    }
    return _user;
}

- (void)pushViewModel:(LWViewModel *)viewModel animated:(BOOL)animated {}

- (void)popViewModelAnimated:(BOOL)animated {}

- (void)popToRootViewModelAnimated:(BOOL)animated {}

- (void)presentViewModel:(LWViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)resetRootViewModel:(LWViewModel *)viewModel {}

@end

//
//  LWRouter.h
//  TestProject
//
//  Created by 动感超人 on 2017/11/8.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWViewController.h"
#import "LWViewModel.h"

@interface LWRouter : NSObject

+ (instancetype)sharedInstance;
- (id)viewControllerForViewModel:(LWViewModel *)viewModel;
- (void)userSignOut:(id<LWViewModelServices>)services;//用户注销

@end

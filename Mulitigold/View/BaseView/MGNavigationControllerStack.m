//
//  MGNavigationControllerStack.m
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/22.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "MGNavigationControllerStack.h"
#import "MGRouter.h"

@implementation MGNavigationControllerStack

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registerNavigationHooks];
    }
    return self;
}

- (void)registerNavigationHooks {
    
    [[self rac_signalForSelector:@selector(resetRootViewModel:)]
    subscribeNext:^(RACTuple *tuple) {
        
        UIViewController *viewController = (UIViewController *)[MGRouter.sharedInstance viewControllerForViewModel:tuple.first];
        MGSharedAppDelegate.window.rootViewController = viewController;
        
    }];
}

- (void)resetRootViewModel:(MGViewModel *)viewModel {}

@end

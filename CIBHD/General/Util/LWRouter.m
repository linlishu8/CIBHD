//
//  LWRouter.m
//  TestProject
//
//  Created by 动感超人 on 2017/11/8.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import "LWRouter.h"

@implementation LWRouter

+ (instancetype)sharedInstance {
    static LWRouter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)viewControllerForViewModel:(LWViewModel *)viewModel {
    NSString *viewController = self.viewModelViewMappings[NSStringFromClass(viewModel.class)];
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}

- (NSDictionary *)viewModelViewMappings {
    return @{
             @"CIBWelcomeViewModel" : @"CIBWelcomeViewController"
             };
}

- (void)userSignOut:(id<LWViewModelServices>)services {

}

@end

//
//  MGRouter.m
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/22.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "MGRouter.h"

@implementation MGRouter

+ (instancetype)sharedInstance {
    static MGRouter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (MGViewController *)viewControllerForViewModel:(MGViewModel *)viewModel {
    NSLog(@"%@",NSStringFromClass(viewModel.class));
    NSString *viewController = self.viewModelViewMappings[NSStringFromClass(viewModel.class)];
    
    NSParameterAssert([NSClassFromString(viewController) isSubclassOfClass:[MGViewController class]]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (NSDictionary *)viewModelViewMappings {
    return @{
             @"MGHomepageViewModel": @"MGHomepageViewController"
             };
}

@end

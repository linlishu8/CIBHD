//
//  BaseNavigationController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/29.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIViewController+CustomBackBarButtonItem.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //Get the custom back button from the pushing view controller
    UIBarButtonItem *customBack = [self.topViewController customBackBarButtonItem];
    customBack.target = self;
    customBack.action = @selector(goBack);
    //Set it as the left bar button item for the pushed view controller
    viewController.navigationItem.leftBarButtonItem = customBack;
    [super pushViewController:viewController animated:animated];
}

- (void)goBack
{
    [self popViewControllerAnimated:YES];
}

@end

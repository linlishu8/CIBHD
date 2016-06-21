//
//  MGTabBarControllerConfig.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/17.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGTabBarControllerConfig.h"
#import "MGGomeViewController.h"
#import "MGGoldViewController.h"

@interface MGTabBarControllerConfig ()

@property (nonatomic, readwrite, strong) MGTabBarController *tabBarController;

@end

@implementation MGTabBarControllerConfig

- (MGTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        MGGomeViewController *firstViewController = [[MGGomeViewController alloc] init];
        UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:firstViewController];
        
        MGGoldViewController *secondViewController = [[MGGoldViewController alloc] init];
        UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                        initWithRootViewController:secondViewController];
        
        UIViewController *thirdViewController = [[UIViewController alloc] init];
        UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:thirdViewController];
        
        UIViewController *fourthViewController = [[UIViewController alloc] init];
        UIViewController *fourthNavigationController = [[UINavigationController alloc]
                                                        initWithRootViewController:fourthViewController];
        MGTabBarController *tabBarController = [[MGTabBarController alloc] init];
        
        // 在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
        [self setUpTabBarItemsAttributesForController:tabBarController];
        
        [tabBarController setViewControllers:@[
                                               firstNavigationController,
                                               secondNavigationController,
                                               thirdNavigationController,
                                               fourthNavigationController
                                               ]];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (void)setUpTabBarItemsAttributesForController:(MGTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            @"MGTabBarItemTitle" : @"国美黄金",
                            @"MGTabBarItemImage" : @"MG_tabbar_first",
                            @"MGTabBarItemSelectedImage" : @"MG_tabbar_first_selected",
                            };
    NSDictionary *dict2 = @{
                            @"MGTabBarItemTitle" : @"理财金",
                            @"MGTabBarItemImage" : @"MG_tabbar_second",
                            @"MGTabBarItemSelectedImage" : @"MG_tabbar_second_selected",
                            };
    NSDictionary *dict3 = @{
                            @"MGTabBarItemTitle" : @"资产",
                            @"MGTabBarItemImage" : @"MG_tabbar_third",
                            @"MGTabBarItemSelectedImage" : @"MG_tabbar_third_selected",
                            };
    NSDictionary *dict4 = @{
                            @"MGTabBarItemTitle" : @"更多",
                            @"MGTabBarItemImage" : @"MG_tabbar_fourth",
                            @"MGTabBarItemSelectedImage" : @"MG_tabbar_fourth_selected"
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3,
                                       dict4
                                       ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}

@end

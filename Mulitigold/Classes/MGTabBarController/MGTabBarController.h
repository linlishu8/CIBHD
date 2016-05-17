//
//  MGTabBarController.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/16.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGTabBarController : UITabBarController

@property (nonatomic, readwrite, copy) NSArray<UIViewController *> *viewControllers;

@property (nonatomic, readwrite, copy) NSArray<NSDictionary *> *tabBarItemsAttributes;

@end

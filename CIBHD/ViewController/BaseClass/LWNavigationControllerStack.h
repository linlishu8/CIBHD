//
//  LWNavigationControllerStack.h
//  TestProject
//
//  Created by 动感超人 on 2017/11/8.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LWViewModelServices;

@interface LWNavigationControllerStack : NSObject

- (instancetype)initWithServices:(id<LWViewModelServices>)services;

- (void)pushNavigationController:(UINavigationController *)navigationController;

- (UINavigationController *)popNavigationController;

- (UINavigationController *)topNavigationController;

@end

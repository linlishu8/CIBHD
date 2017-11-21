//
//  AppDelegate.h
//  CIBHD
//
//  Created by 动感超人 on 2017/11/21.
//  Copyright © 2017年 cib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWNavigationControllerStack.h"

@interface CIBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readonly) LWNavigationControllerStack *navigationControllerStack;

@end


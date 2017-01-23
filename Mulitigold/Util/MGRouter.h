//
//  MGRouter.h
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/22.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGViewController.h"
#import "MGViewModel.h"

@interface MGRouter : NSObject

+ (instancetype)sharedInstance;

- (MGViewController *)viewControllerForViewModel:(MGViewModel *)viewModel;

@end

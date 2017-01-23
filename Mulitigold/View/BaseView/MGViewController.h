//
//  MGViewController.h
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/22.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGViewModel.h"

@interface MGViewController : UIViewController

@property (nonatomic, strong, readonly) MGViewModel *viewModel;
@property (nonatomic, strong, readonly) UIPercentDrivenInteractiveTransition *interactivePopTransition;

- (instancetype)initWithViewModel:(MGViewModel *)viewModel;

@end

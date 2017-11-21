//
//  LWViewController.h
//  TestProject
//
//  Created by 动感超人 on 2017/11/8.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWViewController : UIViewController

@property (nonatomic, strong, readonly) LWViewModel *viewModel;

- (instancetype)initWithViewModel:(LWViewModel *)viewModel;

- (void)bindViewModel;

- (void)adjustStatusBar;

@end

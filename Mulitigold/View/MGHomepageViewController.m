//
//  MGHomepageViewController.m
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/22.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "MGHomepageViewController.h"
#import "MGNavigationController.h"
#import "MGGoldViewController.h"
#import "MGDepositViewController.h"
#import "MGAssetsViewController.h"
#import "MGMoreViewController.h"
#import "MGHomepageViewModel.h"

@interface MGHomepageViewController ()

@property (nonatomic, strong) MGHomepageViewModel *viewModel;

@end

@implementation MGHomepageViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *goldNavigationController = ({
        [self navigationControllerWithView:[[MGGoldViewController alloc] initWithViewModel:self.viewModel.goldViewModel] WithTitle:@"国美黄金" imageName:@"uncunjinbao" selectedImageName:@"uncunjinbao1"];
    });
    
    UINavigationController *depositNavigationController = ({
        [self navigationControllerWithView:[[MGDepositViewController alloc] init] WithTitle:@"存金" imageName:@"unfinancingbutton" selectedImageName:@"unfinancingbutton1"];
    });
    
    UINavigationController *assetsNavigationController = ({
        [self navigationControllerWithView:[[MGAssetsViewController alloc] init] WithTitle:@"资产" imageName:@"unperson" selectedImageName:@"unperson1"];
    });
    
    UINavigationController *moreNavigationController = ({
        [self navigationControllerWithView:[[MGMoreViewController alloc] init] WithTitle:@"更多" imageName:@"unmore" selectedImageName:@"unmore1"];
    });
    
    self.tabBarController.viewControllers = @[ goldNavigationController, depositNavigationController, assetsNavigationController, moreNavigationController ];

}

- (MGNavigationController *)navigationControllerWithView:(UIViewController *)viewController
                                               WithTitle:(NSString *)title
                                               imageName:(NSString *)imageName
                                       selectedImageName:(NSString *)selectedImageName {
    
    viewController.tabBarItem.title = title;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:10], NSForegroundColorAttributeName : colorA1} forState:UIControlStateSelected];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10],  NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    
    if (imageName) {
        UIImage *normalImage = [UIImage imageNamed:imageName];
        normalImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.tabBarItem.image = normalImage;
    }
    if (selectedImageName) {
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.tabBarItem.selectedImage = selectedImage;
    }
    return [[MGNavigationController alloc] initWithRootViewController:viewController];;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  MGTabBarController.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/16.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGTabBarController.h"

NSUInteger MGTabbarItemsCount = 0;
CGFloat MGTabBarItemWidth = 0.0f;

@interface MGTabBarController ()

@end

@implementation MGTabBarController

@synthesize viewControllers = _viewControllers;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setViewControllers:(NSArray *)viewControllers {
    if (_viewControllers && _viewControllers.count) {
        for (UIViewController *viewController in _viewControllers) {
            [viewController willMoveToParentViewController:nil];
            [viewController.view removeFromSuperview];
            [viewController removeFromParentViewController];
        }
    }
    if (viewControllers && [viewControllers isKindOfClass:[NSArray class]]) {
        if ((!_tabBarItemsAttributes) || (_tabBarItemsAttributes.count != viewControllers.count)) {
            [NSException raise:@"MGTabBarController" format:@"设置_tabBarItemsAttributes属性时，请确保元素个数与控制器的个数相同，并在方法`-setViewControllers:`之前设置"];
        }
        _viewControllers = [viewControllers copy];
        
        MGTabbarItemsCount = [viewControllers count];
        MGTabBarItemWidth = [UIScreen mainScreen].bounds.size.width / (MGTabbarItemsCount);
        NSUInteger idx = 0;
        for (UIViewController *viewController in _viewControllers) {
            NSString *title = _tabBarItemsAttributes[idx][@"MGTabBarItemTitle"];
            NSString *normalImageName = _tabBarItemsAttributes[idx][@"MGTabBarItemImage"];
            NSString *selectedImageName = _tabBarItemsAttributes[idx][@"MGTabBarItemSelectedImage"];
            
            [self addOneChildViewController:viewController
                                  WithTitle:title
                            normalImageName:normalImageName
                          selectedImageName:selectedImageName];
            idx++;
        }
    }
}

/**
 *  添加一个子控制器
 *
 *  @param viewController    控制器
 *  @param title             标题
 *  @param normalImageName   图片
 *  @param selectedImageName 选中图片
 */
- (void)addOneChildViewController:(UIViewController *)viewController
                        WithTitle:(NSString *)title
                  normalImageName:(NSString *)normalImageName
                selectedImageName:(NSString *)selectedImageName {
    
    viewController.tabBarItem.title = title;

    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : SYSTEMFONT(11.0), NSForegroundColorAttributeName : TAB_BAR_COLOR} forState:UIControlStateSelected];
    
    // 字体颜色 未选中
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : SYSTEMFONT(11.0),  NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    
    
    if (normalImageName) {
        UIImage *normalImage = [UIImage imageNamed:normalImageName];
        normalImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.tabBarItem.image = normalImage;
    }
    if (selectedImageName) {
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.tabBarItem.selectedImage = selectedImage;
    }
    [self addChildViewController:viewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

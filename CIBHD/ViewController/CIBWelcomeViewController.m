//
//  CIBWelcomeViewController.m
//  CIBHD
//
//  Created by 动感超人 on 2017/11/21.
//  Copyright © 2017年 cib. All rights reserved.
//

#import "CIBWelcomeViewController.h"

@interface CIBWelcomeViewController ()

@end

@implementation CIBWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self.view setBackgroundColor:HexRGB(0xf5f8fe)];
    
    UIImageView *bankLogo = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds)-375)/2, 175, 375, 75)];
    [bankLogo setImage:[UIImage imageNamed:@"welcomePage"]];
    [bankLogo setAlpha:0.0];
    [self.view addSubview:bankLogo];
    
    UIImageView *bankFont = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds)-375)/2, 380, 375, 29)];
    [bankFont setImage:[UIImage imageNamed:@"welcomePageFont"]];
    [bankFont setAlpha:0.0];
    [self.view addSubview:bankFont];
    
    UILabel *versionLabel = [UILabel label].normalText(@"版本号：V2.0.4").normalFont(CIBFont(18)).normalColor(DEFINE_COR3);
    [versionLabel setFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds)-50, CGRectGetWidth(self.view.bounds), 20)];
    [versionLabel setTextAlignment:NSTextAlignmentCenter];
    [versionLabel setAlpha:0.0];
    [self.view addSubview:versionLabel];
    
    [UIView animateWithDuration:1.8 delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [bankLogo setAlpha:1.0];
        [bankLogo setFrame:CGRectMake((CGRectGetWidth(self.view.bounds)-375)/2, 290, 375, 75)];
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:1.3 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionTransitionNone animations:^{
        [bankFont setAlpha:1.0];
        [versionLabel setAlpha:1.0];
    } completion:nil];
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

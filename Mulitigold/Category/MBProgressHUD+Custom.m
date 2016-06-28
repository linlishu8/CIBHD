//
//  MBProgressHUD+Custom.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/28.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MBProgressHUD+Custom.h"

@implementation MBProgressHUD (Custom)

+ (void)showMBProgressHUD:(UIView *)addView
{
    MBProgressHUD *hud = [self HUDForView:addView];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:addView animated:YES];
        hud.labelText = NSLocalizedString(@"加载中...", @"HUD loading title");
    }
}

+ (void)hideMBProgressHUD:(UIView *)addView
{
    MBProgressHUD *hud = [self HUDForView:addView];
    if (hud) {
        [hud hide:YES];
    }
}

@end

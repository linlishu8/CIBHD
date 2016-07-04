//
//  UIBarButtonItem+CustomImage.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/29.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "UIBarButtonItem+CustomImage.h"

@implementation UIBarButtonItem (CustomImage)

+ (UIBarButtonItem *)barItemWithImage:(UIImage *)image
{
    UIButton *imgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imgButton setImage:image forState:UIControlStateNormal];
    imgButton.frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    
    UIBarButtonItem *b = [[UIBarButtonItem alloc]initWithCustomView:imgButton];
    
    [imgButton addTarget:b action:@selector(performBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return b;
}

+ (UIBarButtonItem *)defaultBackButton
{
    //Set your default custom back button here.
    return [UIBarButtonItem barItemWithImage:[UIImage imageNamed:@"MG_Nav_backbutton"]];
}

- (void)performBarButtonAction:(UIButton *)sender
{
    [[self target] performSelector:self.action withObject:self];
}

@end

//
//  BaseNavBarHiddenController.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/18.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, HYHidenControlOptions) {
    
    HYHidenControlOptionLeft = 0x01,
    HYHidenControlOptionTitle = 0x01 << 1,
    HYHidenControlOptionRight = 0x01 << 2,
    
};

@interface BaseNavBarHiddenController : UIViewController

- (void)setKeyScrollView:(UIScrollView * )keyScrollView scrolOffsetY:(CGFloat)scrolOffsetY options:(HYHidenControlOptions)options;

@end

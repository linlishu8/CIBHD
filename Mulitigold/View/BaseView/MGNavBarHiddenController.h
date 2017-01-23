//
//  MGNavBarHiddenController.h
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/23.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "MGViewController.h"

typedef NS_OPTIONS(NSUInteger, MGHidenControlOptions) {
    
    MGHidenControlOptionLeft = 0x01,
    MGHidenControlOptionTitle = 0x01 << 1,
    MGHidenControlOptionRight = 0x01 << 2,
    
};

@interface MGNavBarHiddenController : MGViewController

- (void)setKeyScrollView:(UIScrollView * )keyScrollView
            scrolOffsetY:(CGFloat)scrolOffsetY
                 options:(MGHidenControlOptions)options;

@end

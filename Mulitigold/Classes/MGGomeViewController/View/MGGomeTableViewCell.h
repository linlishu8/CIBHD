//
//  MGGomeTableViewCell.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/24.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface MGGomeTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *bannerItems;
@property (nonatomic, weak) id<SDCycleScrollViewDelegate> delegate;

@end

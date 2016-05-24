//
//  BaseTableView.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/24.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACTableViewDelegte.h"

@interface BaseTableView : UITableView

@property (nonatomic, strong) ACTableViewDelegte *tableDelegate;

@end

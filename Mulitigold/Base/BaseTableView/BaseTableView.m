//
//  BaseTableView.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/24.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        [self setSeparatorColor:[UIColor clearColor]];
        self.tableDelegate = [[ACTableViewDelegte alloc] init];
        self.delegate = self.tableDelegate;
        self.dataSource = self.tableDelegate;
    }
    return self;
}

@end

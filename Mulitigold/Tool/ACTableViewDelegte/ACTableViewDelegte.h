//
//  ACTableViewDelegte.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/19.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSInteger (^numberOfSectionsInTableView)();
typedef NSInteger (^numberOfRowsInSection)(NSInteger section);
typedef NSString *(^rowCellIdentifier)(NSIndexPath *path);

@interface ACTableViewDelegte : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) numberOfSectionsInTableView sections;
@property (nonatomic, copy) numberOfRowsInSection rows;
@property (nonatomic, copy) rowCellIdentifier cellIdentifier;

@end

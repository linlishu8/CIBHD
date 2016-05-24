//
//  ACTableViewDelegte.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/19.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSInteger (^numberOfSectionsInTableView)(); //sections
typedef NSInteger (^numberOfRowsInSection)(NSInteger section); //rows
typedef NSString * (^rowCellIdentifier)(NSIndexPath *path); //自定义复用标识
typedef void (^cellForRowAtIndexPath)(id cell, NSIndexPath *path); //cell创建
typedef void (^selectRowAtIndexPath)(NSIndexPath *path); //点击事件
typedef CGFloat (^heightForRowAtIndexPath)(NSIndexPath *path); //cell高度

@interface ACTableViewDelegte : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) numberOfSectionsInTableView sections;
@property (nonatomic, copy) numberOfRowsInSection rows;
@property (nonatomic, copy) rowCellIdentifier cellIdentifier;
@property (nonatomic, copy) selectRowAtIndexPath selectRow;
@property (nonatomic, copy) cellForRowAtIndexPath cellAtIndexPath;
@property (nonatomic, copy) heightForRowAtIndexPath heightForRow;

@end

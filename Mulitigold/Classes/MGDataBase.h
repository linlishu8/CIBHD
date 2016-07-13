//
//  MGDataBase.h
//  Mulitigold
//
//  Created by 动感超人 on 16/7/4.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGDataBase : NSObject

+ (instancetype)shareDataBase;

- (void)createTable:(Class)aClass;

@end

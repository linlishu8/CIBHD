//
//  MGDataBase.h
//  Mulitigold
//
//  Created by 动感超人 on 16/7/4.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLFMDBAdapter.h"

@interface MGDataBase : NSObject

+ (instancetype)shareDataBase;

- (NSArray *)findAll:(Class)aClass;

- (void)createTable:(Class)aClass;

- (void)insertModel:(MTLModel<MTLFMDBSerializing> *)model;
- (void)insertModel:(MTLModel<MTLFMDBSerializing> *)model completion:(void(^)(BOOL success))completion;

@end

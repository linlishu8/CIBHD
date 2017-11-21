//
//  NSDictionary+LWDictionary.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/12.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (LWDictionary)

//获得一般模型属性
-(void)lw_createProperty;

//获得网络模型属性
-(void)lw_createNetProperty;

/** 合并两个NSDictionary */
+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;

/** 并入一个NSDictionary */
- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict;

- (NSDictionary *)dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryByRemovingEntriesWithKeys:(NSSet *)keys;

@end

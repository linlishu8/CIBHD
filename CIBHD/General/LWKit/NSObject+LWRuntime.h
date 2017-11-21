//
//  NSObject+LWRuntime.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/12.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LWRuntime)

/** 属性列表 */
- (NSArray *)propertiesInfo;
+ (NSArray *)propertiesInfo;
/** 格式化之后的属性列表 */
+ (NSArray *)propertiesWithCodeFormat;


/** 成员变量列表 */
- (NSArray *)ivarInfo;
+ (NSArray *)ivarInfo;


/** 对象方法列表 */
- (NSArray *)instanceMethodList;
+ (NSArray *)instanceMethodList;
/** 类方法列表 */
+ (NSArray *)classMethodList;


/** 协议列表 */
- (NSDictionary *)protocolList;
+ (NSDictionary *)protocolList;


/** 交换实例方法 */
+ (void)swizzlingInstanceMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;
/** 交换类方法 */
+ (void)swizzlingClassMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;


/** 添加方法 */
+ (void)addMethodWithSEL:(SEL)methodSEL methodIMP:(SEL)methodIMP;

@end

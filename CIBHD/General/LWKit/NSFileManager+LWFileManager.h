//
//  NSFileManager+LWFileManager.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/12.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (LWFileManager)

+ (NSURL *)documentsURL;

+ (NSString *)documentsPath;

+ (NSURL *)libraryURL;

+ (NSString *)libraryPath;

+ (NSURL *)cachesURL;

+ (NSString *)cachesPath;

@end

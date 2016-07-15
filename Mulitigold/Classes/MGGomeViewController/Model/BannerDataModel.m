//
//  BannerDataModel.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/18.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "BannerDataModel.h"

@implementation BannerDataModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
//             @"bannerId": @"bannerId",
             @"content" : @"content",
             @"elementDesc" : @"elementDesc",
//             @"elementSequence": @"elementSequence",
             @"elementTitle" : @"elementTitle",
             @"imgUrl" : @"imgUrl",
//             @"target": @"target",
             @"tolink" : @"tolink"
//             @"type": @"type"
             };
}

+ (NSDictionary *)FMDBColumnsByPropertyKey
{
    return @{
             @"content" : @"content",
             @"elementDesc" : @"elementDesc",
             @"elementTitle" : @"elementTitle",
             @"imgUrl" : @"imgUrl",
             @"tolink" : @"tolink"
             };
}

+ (NSArray *)FMDBPrimaryKeys
{
    return @[@"imgUrl"];
}

+ (NSString *)FMDBTableName {
    return @"BannerDataModel";
}

@end

@implementation BannerFootModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"responseParams" : @"responseParams",
             @"goldRate" : @"responseParams.goldRate"
             };
}

@end

@implementation BannerImageModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"imgUrl" : @"imgUrl"
             };
}

+ (NSDictionary *)FMDBColumnsByPropertyKey
{
    return @{
             @"imgUrl" : @"imgUrl"
             };
}

+ (NSArray *)FMDBPrimaryKeys
{
    return @[@"imgUrl"];
}

+ (NSString *)FMDBTableName {
    return @"BannerImageModel";
}

@end

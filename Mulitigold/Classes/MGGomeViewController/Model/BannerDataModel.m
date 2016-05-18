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
             @"result": @"result",
             @"bannerElements": @"bannerElements",
             @"imgUrl": @"bannerElements.imgUrl",
             @"tolink": @"bannerElements.tolink",
             };
}

@end

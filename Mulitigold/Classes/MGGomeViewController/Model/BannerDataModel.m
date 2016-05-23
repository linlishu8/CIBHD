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
             @"content": @"content",
             @"elementDesc": @"elementDesc",
//             @"elementSequence": @"elementSequence",
             @"elementTitle": @"elementTitle",
             @"imgUrl": @"imgUrl",
//             @"target": @"target",
             @"tolink": @"tolink",
//             @"type": @"type"
             };
}

@end

//
//  MGIncomeModel.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/23.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGIncomeModel.h"

@implementation MGIncomeModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"inrate": @"inrate"
             };
}

@end

@implementation MGForUseNewModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"balance": @"balance",
             @"timeLimit": @"tBaseLCProcuct.timeLimit",
             @"lcPrdName": @"tBaseLCProcuct.lcPrdName",
             @"lcPrdCode": @"tBaseLCProcuct.lcPrdCode",
             @"inrate": @"tBaseLCProcuct.inrate"
             };
}

@end

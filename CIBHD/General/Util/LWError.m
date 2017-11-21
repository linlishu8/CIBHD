//
//  LWError.m
//  TestProject
//
//  Created by 动感超人 on 2017/11/8.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import "LWError.h"

const NSInteger ECUserLoginErrorAuthenticationFailed = 666;//需要重新登录
const NSInteger ECErrorServiceRequestFailedNotOutPut = 668;//无需提醒

@implementation LWError

+ (NSError *)requestRemoteDataErrorsFilter:(NSString *)errorDomain errorCode:(NSInteger)errorCode {
    return [NSError errorWithDomain:errorDomain code:errorCode userInfo:nil];
}

+ (NSError *)requestErrors:(NSError *)error {
    return [LWError requestRemoteDataErrorsFilter:error.domain errorCode:ECErrorServiceRequestFailedNotOutPut];
}

@end

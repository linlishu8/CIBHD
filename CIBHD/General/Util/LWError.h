//
//  LWError.h
//  TestProject
//
//  Created by 动感超人 on 2017/11/8.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSInteger ECUserLoginErrorAuthenticationFailed;//自动登录失败（用户名密码错误）
extern const NSInteger ECErrorServiceRequestFailedNotOutPut;

@interface LWError : NSError

+ (NSError *)requestRemoteDataErrorsFilter:(NSString *)errorDomain errorCode:(NSInteger)errorCode;

+ (NSError *)requestErrors:(NSError *)error;


@end

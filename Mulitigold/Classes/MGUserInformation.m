//
//  MGUserInformation.m
//  Mulitigold
//
//  Created by 动感超人 on 16/6/28.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGUserInformation.h"

@implementation MGAccountModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"rntCodeValue": @"rntCodeValue",
             @"responseParams": @"responseParams",
             @"rntMsg": @"rntMsg",
             @"errorMsg": @"errorMsg",
             @"rntCode": @"rntCode"
             };
}

@end

@interface MGUserInformation ()

@property (nonatomic, strong) YABaseDataEngine *gomeDataEngine;

@end


@implementation MGUserInformation

static id instance_;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [[self alloc] init];
    });
    return instance_;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [super allocWithZone:zone];
    });
    return instance_;
}

- (void)goldAccountInformationQuery:(void(^)(MGAccountModel *))complete
{
    self.gomeDataEngine = [MGGomeDataEngine control:self params:@{@"channelId":@"21",@"token":@".EE01217F-E261-4E33-A845-016E03F7FB0C"} path:GoldAccountInformation addressType:YAAddressManagerType2 requestType:YAAPIManagerRequestTypePost complete:^(NSDictionary *rntCode, NSError *error) {
        if (error) {
            NSLog(@"error:%@",error.localizedDescription);
        } else {
            if (rntCode) {
                NSError *error;
                MGAccountModel *accountModel = [MTLJSONAdapter modelOfClass:[MGAccountModel class] fromJSONDictionary:rntCode error:&error];
                if(error){
                    NSLog(@"error:%@, Info:%@",error,error.userInfo);
                } else {
                    complete(accountModel);
                }
            }
        }
    }];
}

@end

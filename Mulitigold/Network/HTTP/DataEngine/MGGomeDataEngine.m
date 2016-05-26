//
//  MGGomeDataEngine.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/20.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "MGGomeDataEngine.h"

@implementation MGGomeDataEngine

+ (YABaseDataEngine *)control:(NSObject *)control
                       params:(NSDictionary *)params
                         path:(NSString *)path
                  addressType:(YAAddressManagerType)addressType
                  requestType:(YAAPIManagerRequestType)requestType
                     complete:(CompletionDataBlock)responseBlock
{
    return [YABaseDataEngine control:control callAPIWithServiceType:YAServiceFWZ path:path param:params addressType:addressType requestType:requestType alertType:DataEngineAlertType_None progressBlock:nil complete:responseBlock errorButtonSelectIndex:nil];
}


@end

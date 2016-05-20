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
                      keyWord:(NSString *)keyWord
                     complete:(CompletionDataBlock)responseBlock
{
    NSDictionary *param = @{@"keyWord":keyWord};
    return [YABaseDataEngine control:control callAPIWithServiceType:YAServiceFWZ path:@"banner/bannerListPage" param:param requestType:YAAPIManagerRequestTypeGet alertType:DataEngineAlertType_None progressBlock:nil complete:responseBlock errorButtonSelectIndex:nil];
}

@end

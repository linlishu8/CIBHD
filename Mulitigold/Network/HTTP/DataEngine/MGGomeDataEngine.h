//
//  MGGomeDataEngine.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/20.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YABaseDataEngine.h"

@interface MGGomeDataEngine : NSObject

+ (YABaseDataEngine *)control:(NSObject *)control
                    keyWord:(NSString *)keyWord
                     complete:(CompletionDataBlock)responseBlock;

@end

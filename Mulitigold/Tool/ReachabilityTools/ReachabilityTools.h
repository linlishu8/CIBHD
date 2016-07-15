//
//  ReachabilityTools.h
//  Mulitigold
//
//  Created by 动感超人 on 16/7/15.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReachabilityTools : NSObject

@property(nonatomic, readonly) BOOL isConnect;//是否有网络连接

+ (instancetype)sharedManager;

- (void)appleReachability;

@end

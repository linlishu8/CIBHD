//
//  ReachabilityTools.m
//  Mulitigold
//
//  Created by 动感超人 on 16/7/15.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "ReachabilityTools.h"
#import "Reachability.h"

@interface ReachabilityTools ()

@property (nonatomic, strong) Reachability *hostReachability;
@property(nonatomic, readwrite) BOOL isConnect;

@end

@implementation ReachabilityTools

+ (instancetype)sharedManager {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)appleReachability
{
    /// Reachability使用了通知，当网络状态发生变化时发送通知kReachabilityChangedNotification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appReachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    // 被通知函数运行的线程应该由startNotifier函数执行的线程决定
    typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *remoteHostName = @"www.baidu.com";
        weakSelf.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
        [weakSelf.hostReachability startNotifier];
        
        // 开启当前线程消息循环
        [[NSRunLoop currentRunLoop] run];
    });
}

/// 当网络状态发生变化时调用
- (void)appReachabilityChanged:(NSNotification *)notification
{
    Reachability *reach = [notification object];
    if([reach isKindOfClass:[Reachability class]]){
        NetworkStatus status = [reach currentReachabilityStatus];
        // 两种检测:路由与服务器是否可达  三种状态:手机流量联网、WiFi联网、没有联网
        if (reach == self.hostReachability) {
            if (status == NotReachable) {
                NSLog(@"hostReachability failed");
                self.isConnect = NO;
            } else if (status == ReachableViaWiFi) {
                NSLog(@"hostReachability ReachableViaWiFi");
                self.isConnect = YES;
            } else if (status == ReachableViaWWAN) {
                NSLog(@"hostReachability ReachableViaWWAN");
                self.isConnect = YES;
            }
        }
        
    }
}

@end

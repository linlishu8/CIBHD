//
//  NSTimer+WHTimer.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/12.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TimerCallback)(NSTimer *timer);

@interface NSTimer (LWTimer)

+ (NSTimer *)lw_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                       repeats:(BOOL)repeats
                                      callback:(TimerCallback)callback;

+ (NSTimer *)lw_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         count:(NSInteger)count
                                      callback:(TimerCallback)callback;

/** 暂停NSTimer */
- (void)pauseTimer;

/** 开始NSTimer */
- (void)resumeTimer;

/** 延迟开始NSTimer */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end

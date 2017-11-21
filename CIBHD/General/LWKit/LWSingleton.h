//
//  LWSingleton.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/13.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#define LWSingletonH(ClassName) +(instancetype) share##ClassName;


#define LWSingletonM(ClassName) static id _instance;\
\
+(instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
\
return _instance;\
}\
\
\
+(instancetype)share##ClassName\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[self alloc] init];\
});\
\
return _instance;\
}\
\
\
-(id)copyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
\
\
- (id)mutableCopyWithZone:(nullable NSZone *)zone\
{\
return _instance;\
}

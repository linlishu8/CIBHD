//
//  LWMacro.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/13.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#ifndef LWMacro_h
#define LWMacro_h


#define STATUS_BAR_BIGGER_THAN_20 [UIApplication sharedApplication].statusBarFrame.size.height > 20

///------------
/// AppDelegate
///------------

#define LWSharedAppDelegate ((CIBAppDelegate *)[UIApplication sharedApplication].delegate)

///------
/// FontSize
///------

#define CIBFont(x) [UIFont systemFontOfSize:(x)]
#define CIBBoldFont(x) [UIFont boldSystemFontOfSize:(x)]

//NSLog
#ifdef DEBUG
#define NSLog(...) NSLog(@"%s 第%d行: %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

///------
/// Block
///------

typedef void (^VoidBlock)();

//APP版本号
#define KAPP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//系统版本号
#define KSYSTEM_VERSION [[UIDevice currentDevice] systemVersion]

#define KTOP_HEIGHT 64

//黑色和白色
#define KWHITE_COLOR [UIColor whiteColor]
#define KBLACK_COLOR [UIColor blackColor]


//number转String
#define KINT_TRANSLATE_STR(int_str) [NSString stringWithFormat:@"%d",int_str];
#define KFLOAT_TRANSLATE_STR(float_str) [NSString stringWithFormat:@"%.2d",float_str];

// View 圆角和加边框
#define KVIEW_BORDER_RADIUS(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define KVIEW_RADIUS(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]


//字符串是否为空
#define KSTRING_IS_EMPTY(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define KARRAY_IS_EMPTY(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define KDICT_IS_EMPTY(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define KOBJECT_IS_EMPYT(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//屏幕宽度
#define KSCREEN_WIDTH \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)

//屏幕高度
#define KSCREEN_HEIGHT \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
//屏幕Size
#define KSCREEN_SIZE \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)

//Aplication
#define KAPPLICATION        [UIApplication sharedApplication]
//keyWindow
#define KKEY_WINDOW         [UIApplication sharedApplication].keyWindow
//AppDelegate
#define KAPPDELEGATE        [UIApplication sharedApplication].delegate
//UserDefaults
#define KUSERDEFAULT       [NSUserDefaults standardUserDefaults]
//NSNotificationCenter
#define KNOTIFICATIONCENTER [NSNotificationCenter defaultCenter]

//获取当前语言
#define KCURRENT_LANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])
//判断是否为iPhone
#define KIS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define KIS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//获取沙盒Document路径
#define KDOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒temp路径
#define KTEMP_PATH NSTemporaryDirectory()
//获取沙盒Cache路径
#define KCACHE_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//真机
#endif

#if TARGET_IPHONE_SIMULATOR
//模拟器
#endif

//颜色
#define RGB(r, g, b) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

//常用颜色
#define DEFINE_COR1 HexRGB(0x278fe8) //菜单1点击前
#define DEFINE_COR2 HexRGB(0x398cc5) //菜单1点击后,菜单2点击前
#define DEFINE_COR3 HexRGB(0x6b6a6a) //springborad文字颜色
#define DEFINE_COR4 HexRGB(0x3582b7) //菜单2点击后
#define DEFINE_COR5 HexRGB(0xaaaaaa) //灰色（公告日期）

//弱引用/强引用
#define KWEAK_SELF(type)   __weak typeof(type) weak##type = type;
#define KSTRONG_SELF(type) __strong typeof(type) type = weak##type;

//由角度转换弧度
#define KDEGREES_TO_RADIAN(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define KRANDIAN_TO_DEGREES(radian) (radian * 180.0) / (M_PI)

//获取一段时间间隔
#define KSTART_TIME CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define KEND_TIME   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

#endif /* LWMacro_h */

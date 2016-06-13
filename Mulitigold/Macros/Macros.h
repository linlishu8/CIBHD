//
//  Macros.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/19.
//  Copyright © 2016年 cib. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define DEFINE_LITTLE HEXCOLOR(0x999999)
#define TAB_BAR_COLOR HEXCOLOR(0x318fc9)
#define TAB_HEAD_FOOT HEXCOLOR(0xf4f4f4)

#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:HEIGHT_LFL(FONTSIZE)]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:HEIGHT_LFL(FONTSIZE)]

//获取图片资源
#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//
#define GoldRateAndSysTime @"/api/inrate/getGoldRateAndSysTime"
#define BannerListPage @"banner/bannerListPage"

#endif /* Macros_h */

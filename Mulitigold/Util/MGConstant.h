//
//  MGConstant.h
//  Mulitigold
//
//  Created by 动感超人 on 2016/12/30.
//  Copyright © 2016年 liuwei. All rights reserved.
//

#ifndef MGConstant_h
#define MGConstant_h

///------------
/// AppDelegate
///------------

#define MGSharedAppDelegate ((MGAppDelegate *)[UIApplication sharedApplication].delegate)

///------
/// NSLog
///------

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

#define MRCLogError(error) NSLog(@"Error: %@", error)

///------
/// Block
///------

typedef void (^VoidBlock)();

///-----------
/// SSKeychain
///-----------

#define MRC_SERVICE_NAME @"com.leichunfeng.MVVMReactiveCocoa"
#define MRC_RAW_LOGIN    @"RawLogin"
#define MRC_PASSWORD     @"Password"
#define MRC_ACCESS_TOKEN @"AccessToken"

///------
/// Color
///------

#define RGB(r, g, b) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define colorA1 HexRGB(0x318fc9)

///------
/// FontSize
///------

#define MGFont(x) [UIFont systemFontOfSize:x]
#define MGBoldFont(x) [UIFont boldSystemFontOfSize:x]

#endif /* MGConstant_h */

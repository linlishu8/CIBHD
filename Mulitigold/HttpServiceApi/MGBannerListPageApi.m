//
//  MGBannerListPageApi.m
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/23.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "MGBannerListPageApi.h"

@implementation MGBannerListPageApi {
    NSString *_keyWord;
}

- (id)initWithKeyword:(NSString *)keyWord {
    self = [super init];
    if (self) {
        _keyWord = keyWord;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/banner/bannerListPage";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{
             @"keyWord": _keyWord
             };
}

@end

//
//  YAServer.m
//  NetWorking
//
//  Created by Yasin on 16/4/27.
//  Copyright © 2016年 Yasin. All rights reserved.
//

#import "YAServer.h"

@implementation YAServer
@synthesize developApiBaseUrl = _developApiBaseUrl,testApiBaseUrl = _testApiBaseUrl,prereleaseApiBaseUrl = _prereleaseApiBaseUrl,releaseApiBaseUrl = _releaseApiBaseUrl,hotfixApiBaseUrl = _hotfixApiBaseUrl,addressManagerType = _addressManagerType;

- (NSString *)developApiBaseUrl {
    if (_developApiBaseUrl == nil) {
        switch (_addressManagerType) {
            case YAAddressManagerType1:
                _developApiBaseUrl = @"https://cms.dbjb.com/";
                break;
            case YAAddressManagerType2:
                _developApiBaseUrl = @"https://app.dbjb.com/";
                break;
                
            default:
                break;
        }
    }
    return _developApiBaseUrl;
}

- (NSString *)testApiBaseUrl {
    if (_testApiBaseUrl == nil) {
        _testApiBaseUrl = @"http://www.baidu.com";
    }
    return _testApiBaseUrl;
}

- (NSString *)prereleaseApiBaseUrl {
    if (_prereleaseApiBaseUrl == nil) {
        _prereleaseApiBaseUrl = @"http://www.baidu.com";
    }
    return _prereleaseApiBaseUrl;
}

- (NSString *)hotfixApiBaseUrl{
    if (_hotfixApiBaseUrl == nil) {
        _hotfixApiBaseUrl = @"http://www.baidu.com";
    }
    return _hotfixApiBaseUrl;
}

- (NSString *)releaseApiBaseUrl {
    if (_releaseApiBaseUrl == nil) {
        _releaseApiBaseUrl = @"http://www.baidu.com";
    }
    return _releaseApiBaseUrl;
}
@end

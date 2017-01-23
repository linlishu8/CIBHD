//
//  MGGoldViewModel.m
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/22.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "MGGoldViewModel.h"
#import "MGBannerListPageApi.h"
#import "MGBannerListPageModel.h"

@implementation MGGoldViewModel

- (void)initialize {
    [super initialize];
    
    RAC(self, models) = [self dataSourceWithModels];
    
    
}

- (RACSignal *)dataSourceWithModels {
    return [[[self requestRemoteDataSignal] logError] catchTo:[RACSignal empty]];
}

- (RACSignal *)requestRemoteDataSignal {
    return [[[[[self requestBannerListPageSignal] deliverOn:[RACScheduler mainThreadScheduler]] map:^id(NSDictionary *dict) {
        NSLog(@"%@",@"11111");
        NSArray *elements = dict[@"result"][@"bannerElements"] ? :@[];
        return [[[elements rac_sequence] map:^id(NSDictionary *dict) {
            MGBannerListPageModel *model = [MTLJSONAdapter modelOfClass:[MGBannerListPageModel class] fromJSONDictionary:dict error:nil];
            return model;
        }] array]; 
    }] publish] autoconnect];
}

- (RACSignal *)requestBannerListPageSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"%@",@"22222");
        MGBannerListPageApi *api = [[MGBannerListPageApi alloc] initWithKeyword:@"ios"];
        [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            [subscriber sendNext:request.responseJSONObject];
            [subscriber sendCompleted];
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            [subscriber sendError:request.error];
        }];
        return (RACDisposable *)nil;
    }];
    
}


@end

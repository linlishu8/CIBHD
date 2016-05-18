//
//  BannerDataModel.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/18.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface BannerDataModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSDictionary *result;
@property (nonatomic, strong) NSArray *bannerElements;
@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, copy) NSString *tolink;

@end

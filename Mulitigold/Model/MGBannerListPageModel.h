//
//  MGBannerListPageModel.h
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/23.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MGBannerListPageModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, copy) NSString *tolink;

@end

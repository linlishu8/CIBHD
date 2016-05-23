//
//  BannerDataModel.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/18.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface BannerDataModel : MTLModel<MTLJSONSerializing>

//@property (nonatomic, copy, readonly) NSString *bannerId;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *elementDesc;
//@property (nonatomic, copy, readonly) NSString *elementSequence;
@property (nonatomic, copy, readonly) NSString *elementTitle;
@property (nonatomic, copy, readonly) NSString *imgUrl;
//@property (nonatomic, copy, readonly) NSString *target;
@property (nonatomic, copy, readonly) NSString *tolink;
//@property (nonatomic, copy, readonly) NSString *type;

@end

//
//  MGUserInformation.h
//  Mulitigold
//
//  Created by 动感超人 on 16/6/28.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface MGAccountModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSNumber *rntCodeValue;
@property (nonatomic, copy, readonly) NSString *responseParams;
@property (nonatomic, copy, readonly) NSString *rntMsg;
@property (nonatomic, copy, readonly) NSString *errorMsg;
@property (nonatomic, copy, readonly) NSString *rntCode;

@end

@interface MGUserInformation : NSObject

@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *elementDesc;

+ (instancetype)sharedInstance;

- (void)goldAccountInformationQuery:(void(^)(MGAccountModel *))complete;

@end

//
//  MGIncomeModel.h
//  Mulitigold
//
//  Created by 动感超人 on 16/6/23.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MGIncomeModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *inrate;

@end

@interface MGForUseNewModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *balance;//已售百分比
@property (nonatomic, copy, readonly) NSNumber *timeLimit;//固定周期
@property (nonatomic, copy, readonly) NSString *lcPrdName;//产品名称
@property (nonatomic, copy, readonly) NSString *lcPrdCode;//产品编号
@property (nonatomic, copy, readonly) NSNumber *inrate;//年化收益

@end
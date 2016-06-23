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

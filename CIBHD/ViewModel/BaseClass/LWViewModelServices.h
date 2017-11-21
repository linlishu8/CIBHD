//
//  LWViewModelServices.h
//  TestProject
//
//  Created by 动感超人 on 2017/11/8.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWNavigationProtocol.h"
#import "LWUser.h"

@protocol LWViewModelServices <NSObject, LWNavigationProtocol>

@required

@property (nonatomic, strong) LWUser *user;

@end

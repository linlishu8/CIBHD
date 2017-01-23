//
//  MGHomepageViewModel.h
//  Mulitigold
//
//  Created by 动感超人 on 2017/1/22.
//  Copyright © 2017年 liuwei. All rights reserved.
//

#import "MGViewModel.h"
#import "MGGoldViewModel.h"

@interface MGHomepageViewModel : MGViewModel

@property (nonatomic, strong, readonly) MGGoldViewModel *goldViewModel;

@end

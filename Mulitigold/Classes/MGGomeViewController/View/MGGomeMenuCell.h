//
//  MGGomeMenuCell.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/24.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGGomeMenuCell : UITableViewCell

- (void)setButtons:(NSArray *)buttons clickItemBlock:(void (^)(NSInteger))clickItemBlock;

@end

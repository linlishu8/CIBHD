//
//  UITextField+LWTextField.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/13.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LWTextField)

+ (instancetype)textField;

- (UITextField *(^)(NSString *))normalPlaceholder;

- (UITextField *(^)(UIFont *))normalFont;

- (UITextField *(^)(CGFloat))normalBoderWidth;

- (UITextField *(^)(UIColor *))normalBoderColor;

- (UITextField *(^)(CGFloat))normalCornerRadius;

@end

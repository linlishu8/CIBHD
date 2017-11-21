//
//  UITextField+LWTextField.m
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/13.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import "UITextField+LWTextField.h"

@implementation UITextField (LWTextField)

+ (instancetype)textField {
    return [[[self alloc] init] addLeftindent];
}

- (UITextField *)addLeftindent {
    [self setBackgroundColor:[UIColor whiteColor]];
    self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 30)];
    self.leftViewMode = UITextFieldViewModeAlways;
    return self;
}

- (UITextField *(^)(NSString *))normalPlaceholder {
    return ^(NSString *normalPlaceholder){
        [self setPlaceholder:normalPlaceholder];
        return self;
    };
}

- (UITextField *(^)(UIFont *))normalFont {
    return ^(UIFont *normalFont){
        [self setFont:normalFont];
        return self;
    };
}

- (UITextField *(^)(CGFloat))normalBoderWidth {
    return ^(CGFloat normalBoderWidth){
        self.layer.borderWidth = normalBoderWidth;
        return self;
    };
}

- (UITextField *(^)(UIColor *))normalBoderColor {
    return ^(UIColor *normalBoderColor){
        self.layer.borderColor = normalBoderColor.CGColor;
        return self;
    };
}

- (UITextField *(^)(CGFloat))normalCornerRadius {
    return ^(CGFloat normalCornerRadius){
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = normalCornerRadius;
        return self;
    };
}

@end

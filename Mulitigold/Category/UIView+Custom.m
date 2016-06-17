//
//  UIView+Custom.m
//  Mulitigold
//
//  Created by 动感超人 on 16/5/30.
//  Copyright © 2016年 cib. All rights reserved.
//

#import "UIView+Custom.h"
#import <objc/runtime.h>
static const void *UIButtonBlockKey = &UIButtonBlockKey;

@implementation UILabel (Custom)

+ (UILabel *)lableFrame:(CGRect)rect text:(NSString *)text
{
    UILabel *label = [[self alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor whiteColor];
    label.text = text;
    return label;
}

+ (UILabel *)lableFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font
{
    return [[self lableFrame:rect text:text] labelBindFont:font];
}

+ (UILabel *)lableFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color
{
    return [[self lableFrame:rect text:text font:font] labelBindTextColor:color];
}

- (UILabel *)labelBindFont:(UIFont *)font
{
    [self setFont:font];
    return self;
}

- (UILabel *)labelBindTextColor:(UIColor *)color
{
    [self setTextColor:color];
    return self;
}

@end

@implementation UIButton (Custom)

-(void)addActionHandler:(TouchedBlock)touchHandler{
    objc_setAssociatedObject(self, UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)actionTouched:(UIButton *)btn{
    TouchedBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}

+ (UIButton *)buttonImage:(NSString *)backImage
{
    UIButton *button = [[self alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
    return button;
}

+ (UIButton *)buttonImage:(NSString *)backImage selectedImage:(NSString *)selectedImage
{
    UIButton *button = [self buttonImage:backImage];
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    return button;
}

+ (UIButton *)buttonText:(NSString *)text
{
    UIButton *button = [[self alloc] init];
    [button setTitle:text forState:UIControlStateNormal];
    return button;
}

+ (UIButton *)buttonText:(NSString *)text font:(UIFont *)font
{
    return [[self buttonText:text] buttonBindFont:font];
}

+ (UIButton *)buttonText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color
{
    return [[self buttonText:text font:font] buttonBindTextColor:color];
}

- (UIButton *)buttonBindFont:(UIFont *)font
{
    [self.titleLabel setFont:font];
    return self;
}

- (UIButton *)buttonBindTextColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
    return self;
}

@end

@implementation UIView (Custom)

/**
 *  登录账号密码输入框
 */

+ (UIView *)textFieldAndLabelView:(UIView *)view
                        labelText:(NSString *)labelText
                  placeholderText:(NSString *)placeholder
                     isSecureText:(BOOL)isSecureText
                           target:(id)target
{
    UILabel *label = [UILabel lableFrame:CGRectZero text:labelText font:SYSTEMFONT(15.0) textColor:COLOR333333];
    [view addSubview:label];
    
    UITextField *textField = [UITextField new];
    textField.font = SYSTEMFONT(15.0);
    textField.placeholder = placeholder;
    textField.secureTextEntry = isSecureText;
    textField.delegate = target;
    [view addSubview:textField];
    
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(10);
        make.top.and.bottom.equalTo(view);
        make.width.equalTo(@(WIDTH_LFL(70)));
    }];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right);
        make.top.equalTo(view);
        make.bottom.equalTo(view);
        if (isSecureText) {
            make.right.equalTo(view).offset(WIDTH_LFL(-20));
        } else {
            make.right.equalTo(view);
        }
    }];
    
    if (isSecureText) {
        UIButton *secureButton = [UIButton buttonImage:@"MG_Login_show" selectedImage:@"MG_Login_show_selected"];
        __weak typeof(UIButton) *weakButton = secureButton;
        
        [secureButton addActionHandler:^(NSInteger tag) {
            weakButton.selected = !weakButton.selected;
            textField.enabled = NO;
            textField.secureTextEntry = !textField.secureTextEntry;
            textField.enabled = YES;
        }];
        [view addSubview:secureButton];
        
        [secureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(textField.mas_right);
            make.right.equalTo(view);
            make.width.equalTo(@(WIDTH_LFL(20)));
            make.centerY.equalTo(view);
        }];
    }

    
    return view;
}

@end








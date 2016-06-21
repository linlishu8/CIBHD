//
//  UIView+Custom.h
//  Mulitigold
//
//  Created by 动感超人 on 16/5/30.
//  Copyright © 2016年 cib. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Custom)

+ (UILabel *)lableFrame:(CGRect)rect text:(NSString *)text;
+ (UILabel *)lableFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font;
+ (UILabel *)lableFrame:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color;
+ (UILabel *)lableFrame:(CGRect)rect
                   text:(NSString *)text
                   font:(UIFont *)font
              textColor:(UIColor *)color
          textAlignment:(NSTextAlignment)textAlignment;

@end

typedef void (^TouchedBlock)(NSInteger tag);

@interface UIButton (Custom)

+ (UIButton *)buttonImage:(NSString *)backImage;
+ (UIButton *)buttonImage:(NSString *)backImage selectedImage:(NSString *)selectedImage;
+ (UIButton *)buttonText:(NSString *)text;
+ (UIButton *)buttonText:(NSString *)text font:(UIFont *)font;
+ (UIButton *)buttonText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color;

+ (UIButton *)buttonWithFrame:(CGRect)frame Image:(NSString *)backImage actionBlock:(void (^)())actionBlock;

-(void)addActionHandler:(TouchedBlock)touchHandler;

+ (UIButton *)ImageCenterButton:(NSString *)image
                          title:(NSString *)title
                       fontSize:(CGFloat)fontSize
                      textColor:(UIColor *)textColor;

@end

@interface UIView (Custom)

/**
 *  登录账号密码输入框
 */

+ (UIView *)textFieldAndLabelView:(UIView *)view
                        labelText:(NSString *)labelText
                  placeholderText:(NSString *)placeholder
                     isSecureText:(BOOL)isSecureText
                           target:(id)target;

@end

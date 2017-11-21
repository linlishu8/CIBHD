//
//  UIAlertController+LWAlert.m
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/13.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import "UIAlertController+LWAlert.h"

@implementation UIAlertController (LWAlert)

+ (UIAlertController *)lw_alertControllerWithTitle:(NSString *)title message:(NSString *)message optionStyle:(OptionStyle)optionStyle OkTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okBlock:(dispatch_block_t)okBlock cancelBlock:(dispatch_block_t)cancelBlock {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (optionStyle == OptionStyleStyleOnlyOK) {
        UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:acceptAction];
    } else {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:cancelAction];
        [alert addAction:acceptAction];
    }
    return alert;
}


+ (UIAlertController *)lw_sheetAlertControllerWithTitle:(NSString *)title message:(NSString *)message optionStyle:(OptionStyle)optionStyle OkTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okBlock:(dispatch_block_t)okBlock cancelBlock:(dispatch_block_t)cancelBlock {
    
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    if (optionStyle == OptionStyleStyleOnlyOK) {
        UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:acceptAction];
    } else {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:cancelAction];
        [alert addAction:acceptAction];
    }
    return alert;
}

@end

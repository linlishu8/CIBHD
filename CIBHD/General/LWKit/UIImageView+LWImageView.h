//
//  UIImageView+LWImageView.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/12.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LWImageView)

//快速创建imageView
+ (instancetype)lw_imageViewWithPNGImage:(NSString *)imageName frame:(CGRect)frame;

@end

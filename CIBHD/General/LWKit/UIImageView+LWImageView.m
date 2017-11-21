//
//  UIImageView+LWImageView.m
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/12.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import "UIImageView+LWImageView.h"

@implementation UIImageView (LWImageView)

+ (instancetype)lw_imageViewWithPNGImage:(NSString *)imageName frame:(CGRect)frame {
    UIImageView *imageV=[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageV.frame=frame;
    return imageV;
}

@end

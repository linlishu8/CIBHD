//
//  UIView+LWView.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/13.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapActionBlock)(UITapGestureRecognizer *gestureRecoginzer);
typedef void (^LongPressActionBlock)(UILongPressGestureRecognizer *gestureRecoginzer);

@interface UIView (LWView)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

//截取成图片
- (UIImage *)lw_snapshotImage;

/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)lw_addTapActionWithBlock:(TapActionBlock)block;

/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)lw_addLongPressActionWithBlock:(LongPressActionBlock)block;

/** 找到指定类名的subView */
- (UIView *)lw_findSubViewWithClass:(Class)clazz;
- (NSArray *)lw_findAllSubViewsWithClass:(Class)clazz;

/** 找到指定类名的superView对象 */
- (UIView *)lw_findSuperViewWithClass:(Class)clazz;

/** 找到view上的第一响应者 */
- (UIView *)lw_findFirstResponder;

/** 找到当前view所在的viewcontroler */
- (UIViewController *)lw_findViewController;

//所有子视图
- (NSArray *)lw_allSubviews;

//移除所有子视图
- (void)lw_removeAllSubviews;

//xib加载视图
+ (instancetype)lw_loadViewFromNib;
+ (instancetype)lw_loadViewFromNibWithName:(NSString *)nibName;
+ (instancetype)lw_loadViewFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)lw_loadViewFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

/**
 * 给UIView 设置圆角
 */
@property (assign,nonatomic) IBInspectable NSInteger cornerRadius;
@property (assign,nonatomic) IBInspectable BOOL  masksToBounds;

/**
 * 设置 view的 边框颜色(选择器和Hex颜色)
 * 以及 边框的宽度
 */
@property (assign,nonatomic) IBInspectable NSInteger borderWidth;
@property (strong,nonatomic) IBInspectable NSString  *borderHexRgb;
@property (strong,nonatomic) IBInspectable UIColor   *borderColor;

@end

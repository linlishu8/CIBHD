//
//  UIButton+LWButton.h
//  LWKitDemo
//
//  Created by 动感超人 on 2017/10/12.
//  Copyright © 2017年 LiuweiChina. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchedButtonBlock)(void);

@interface UIButton (LWButton)

+ (instancetype)button;

- (UIButton *(^)(NSString *))normalTitle;

- (UIButton *(^)(NSString *))normalImage;

- (UIButton *(^)(NSString *))normalBackgroundImage;

- (UIButton *(^)(NSString *))selectedBackgroundImage;

- (UIButton *(^)(UIFont *))normalFont;

- (UIButton *(^)(UIColor *))normalColor;

- (UIButton *(^)(UIColor *))normalBackgroundColor;

- (UIButton *(^)(CGFloat))normalCornerRadius;

- (UIButton *(^)(UIEdgeInsets))normalTextEdgeInset;

//多久之后开始执行
- (void)startTime:(NSInteger)timeout waitBlock:(void(^)(NSInteger remainTime))waitBlock finishBlock:(void(^)())finishBlock;

//点击按钮之后的动作
- (void)lw_addActionHandler:(TouchedButtonBlock)touchHandler;


/** 显示菊花 */
- (void)lw_showIndicator;

/** 隐藏菊花 */
- (void)lw_hideIndicator;


/** 改变按钮的响应区域,上左下右分别增加或减小多少  正数为增加 负数为减小*/
@property (nonatomic, assign) UIEdgeInsets clickEdgeInsets;

//badge
@property (strong, nonatomic) UILabel *badge;

/** badge的文字 */
@property (nonatomic) NSString *badgeValue;

/** 背景颜色 */
@property (nonatomic) UIColor *badgeBGColor;

/** 文字颜色 */
@property (nonatomic) UIColor *badgeTextColor;

/** 文字的字体 */
@property (nonatomic) UIFont *badgeFont;

/** badge的padding */
@property (nonatomic) CGFloat badgePadding;

/** 最小的size */
@property (nonatomic) CGFloat badgeMinSize;

/** x坐标 */
@property (nonatomic) CGFloat badgeOriginX;

/** y坐标 */
@property (nonatomic) CGFloat badgeOriginY;

/** 如果是数字0的话就隐藏不显示 */
@property BOOL shouldHideBadgeAtZero;

/** 是否要缩放动画 */
@property BOOL shouldAnimateBadge;

@end

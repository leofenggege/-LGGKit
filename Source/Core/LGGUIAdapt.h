//
//  LGGUIAdapt.h
//  LGGKitDemo
//
//  Created by LeoGege on 3/1/21.
//  UI 适配   

#ifndef LGGUIAdapt_h
#define LGGUIAdapt_h

#import <UIKit/UIKit.h>

#pragma mark - UIScreen


/// UI设计图基准尺寸,不同屏幕尺寸适配（375，667是因为效果图为IPHONEX 如果不是则根据实际情况修改）
static CGFloat const kBaseW = 375.0f;
static CGFloat const kBaseH = 667.0f;

/// 左右间隔
extern CGFloat const kSpace;

#pragma mark ============================== 屏幕适配相关参数 ====================================
/**屏幕宽度*/
extern CGFloat kScreenWidth(void);
/**屏幕高度*/
extern CGFloat kScreenHeight(void);
/// 导航栏高度 44
extern CGFloat const kNavigationbarHeight;
/// 状态栏高度,刘海屏 44 其它 20
extern CGFloat kSafeAreaStatusHeight(void);
/// 状态栏+导航栏
extern CGFloat kNavAndStatusHeight(void);
/// 底部tabBar高度,刘海屏 83 其他 49
extern CGFloat kSafeAreaTabBarBottomHeight(void);
/// iPhoneX 和 非 X高度 底部安全区域
extern CGFloat kSafeAreaBottomHeight(void);
/// 横向尺寸等比缩放
extern CGFloat adaptedWidth(CGFloat);
/// 纵向尺寸等比缩放
extern CGFloat adaptedHeight(CGFloat);
/// 线宽适配
extern CGFloat lineWidth(CGFloat);

#pragma mark ============================== 机型判断(5-5s-se/6-6s-7-8/6plus-7plus-8plus/x-xs/xr-xsmax) ====================================

/// 5-5s-se
extern BOOL isIphone5s(void);
/// 6-6s-7-8
extern BOOL isIphone6s(void);
/// 6plus-7plus-8plus
extern BOOL isIphone6Plus(void);
/// x-xs
extern BOOL isIphoneX(void);
/// xr-xsmax
extern BOOL isIphoneXR(void);

///iphone12mini
extern BOOL isIphone12Mini(void);

///iphone12&&iphone12pro
extern BOOL isIphone12(void);

///iphone12pro max
extern BOOL isIphone12ProMAX(void);

extern BOOL isIphone8P(void);

/// 是否是异形屏
extern BOOL isShapedScreen(void);


#endif /* LGGUIAdapt_h */

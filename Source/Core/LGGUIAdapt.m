//
//  LGGUIAdapt.m
//  LGGKitDemo
//
//  Created by LeoGege on 3/1/21.
//

#import <Foundation/Foundation.h>
#import "LGGUIAdapt.h"

CGFloat kScreenWidth(void){
    return  [UIScreen mainScreen].bounds.size.width;
}

CGFloat kScreenHeight(void){
    return [UIScreen mainScreen].bounds.size.height;
}


CGFloat const kNavigationbarHeight = 44.0;

CGFloat kSafeAreaStatusHeight(void){
//    float statusBarHeight = 0;
//    if (@available(iOS 13.0, *)) {
//        UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
//        statusBarHeight = statusBarManager.statusBarFrame.size.height;
//    }else {
//        statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
//    }
//    return statusBarHeight;
    
    return ((isIphoneX() || isIphoneXR() || isIphone12Mini() || isIphone12() || isIphone12ProMAX()) ? 44.0: 20.0);
}

/// 状态栏+导航栏
CGFloat kSafeAreaTopHeight(void){
    return kNavigationbarHeight + kSafeAreaStatusHeight();
}

/// 底部tabBar高度,刘海屏 83 其他 49
CGFloat kTabBarBottomHeight(void){
    return (kScreenHeight() >= 812.0 ? 83 : 49);
}
/// iPhoneX 和 非 X高度 底部安全区域
CGFloat kSafeAreaBottomHeight(void){
    return (kScreenHeight() >= 812.0 ? 34 : 0);
}

CGFloat adaptedWidth(CGFloat w){
    
    return w * (kScreenWidth()/kBaseW);
}

CGFloat adaptedHeight(CGFloat h){
    return  h * (kScreenHeight()/kBaseH);
}

CGFloat lineWidth(CGFloat w){
    return w/UIScreen.mainScreen.scale;
}

CGFloat AllenScreenW = 0;

BOOL isIphone5s(){
    
    if ((kScreenHeight() == 568.0 && kScreenWidth() == 320.0) || (kScreenHeight() == 320.0 && kScreenWidth() == 568.0)) {
        return YES;
    } else {
        return NO;
    }
}

BOOL isIphone6Plus(){
    if ((kScreenHeight() == 667.0 && kScreenWidth() == 375.0) || (kScreenHeight() == 375.0 && kScreenWidth() == 667.0)) {
        return YES;
    } else {
        return NO;
    }
}


BOOL isIphoneX(){
    if ((kScreenHeight() == 812.0 && kScreenWidth() == 375.0) || (kScreenHeight() == 375.0 && kScreenWidth() == 812.0)) {
        return YES;
    }else{
        return NO;
    }
}


BOOL isIphoneXR()
{
    if ((kScreenHeight() == 896.0 && kScreenWidth() == 414.0) || (kScreenHeight() == 414.0 && kScreenWidth() == 896.0)){
        return YES;
    }else {
        return NO;
    }
}

BOOL isIphone12Mini()
{
    if ((kScreenHeight() == 780.0 && kScreenWidth() == 360.0) || (kScreenHeight() == 360.0 && kScreenWidth() == 780.0)){
        return YES;
    }else {
        return NO;
    }
}

BOOL isIphone12()
{
    if ((kScreenHeight() == 844.0 && kScreenWidth() == 390.0) || (kScreenHeight() == 390.0 && kScreenWidth() == 844.0)){
        return YES;
    }else {
        return NO;
    }
}

BOOL isIphone12ProMAX(){
    if ((kScreenHeight() == 926.0 && kScreenWidth() == 428.0) || (kScreenHeight() == 428.0 && kScreenWidth() == 926.0)){
        return YES;
    }else {
        return NO;
    }
}


BOOL isIphone6s()
{
    if ((kScreenHeight() == 375 && kScreenWidth() == 667) || (kScreenHeight() == 667 && kScreenWidth() == 375)){
        return YES;
    }else {
        return NO;
    }
}

BOOL isIphone8P()
{
    if ((kScreenHeight() == 736 && kScreenWidth() == 414) || (kScreenHeight() == 414 && kScreenWidth() == 736)){
        return YES;
    }else {
        return NO;
    }
}

BOOL isShapedScreen()
{
    if ((kScreenHeight() > 810 || kScreenWidth() > 810) )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark ============================== 颜色 ====================================
UIColor *UIColorFromRGB(NSInteger rgbValue) {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}

//
//  LGGConfig.h
//  LGGKitDemo
//
//  Created by LeoGege on 3/2/21.
//  宏定义

#ifndef LGGConfig_h
#define LGGConfig_h

#pragma mark ============================== 输出 ====================================
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif


#pragma mark ============================== 字体颜色 ====================================
//RGBA的颜色（RGBA模式）
#define RGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// 系统字体
#define font(font) [UIFont systemFontOfSize:font]
// 加粗字体
#define JCFont(f)  [UIFont fontWithName:@"PingFangSC-Medium"size:(f)]

#pragma mark ============================== app信息 ====================================

// app版本
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//NSUserDefaults 实例化
#define kUserDefaults [NSUserDefaults standardUserDefaults]

//document沙盒路径
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0]

// keywindow
#define kKeyWindow [UIApplication sharedApplication].keyWindow

#pragma mark ============================== 代码 ====================================
// 强弱引用
#define WeakSelf __weak typeof(self) weakSelf = self;
#define StrongSelf  __strong typeof(weakSelf) self = weakSelf;

// 判断字符串是否为空或者为空字符串
#define strIsNullOrEmpty(str) (str==nil||[str isEqualToString:@""])
/**判断对象是否为空*/
#define ObjectIsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

#endif /* LGGConfig_h */

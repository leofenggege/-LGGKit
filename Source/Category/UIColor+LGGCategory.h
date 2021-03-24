//
//  UIColor+LGGCategory.h
//  LGGKitDemo
//
//  Created by LeoGege on 3/24/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LGGCategory)

/**根据16进制字符串创建颜色*/
+ (nullable UIColor *)LGG_ColorWithString:(nonnull NSString *)hexString;

/**根据16进制字符串和透明度创建颜色*/
+ (nullable UIColor *)LGG_ColorWithString:(nonnull NSString *)hexString alpha:(CGFloat)alpha;

/**RGB颜色返回*/
+ (nonnull UIColor *)LGG_ColorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

/**RGB 透明度 颜色返回*/
+ (nonnull UIColor *)LGG_ColorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;


/** 以下为C语言 语法快捷调用颜色设置 **/

/** rbg颜色 */
UIColor * _Nullable LGGRGBColor(NSInteger r,NSInteger g,NSInteger b);
/** rbg颜色 带alpha */
UIColor * _Nullable LGGRGBColorWithAlpha(NSInteger r,NSInteger g,NSInteger b,CGFloat alpha);
/** 十六进制颜色  */
UIColor * _Nullable LGGHexColor(NSString * _Nullable hexString);
/** 十六进制颜色 带alpha */
UIColor * _Nullable LGGHexColorWithAlpha(NSString * _Nullable hexString,CGFloat alpha);


@end


@interface NSString (LGG_StringTansformer)

/**
 检查十六进制字符串比如#fff,并给转化成十六进制字符串,比如#ffffff
 
 @return 返回标准的7位十六进制字符串或者初始化一个字符串为十六进制字符串
 */
- (nonnull NSString *)LGG_HexStringTransformFromThreeCharacters;

@end



NS_ASSUME_NONNULL_END

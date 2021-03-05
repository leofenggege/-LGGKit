//
//  UIImage+LGGCategory.h
//  LGGKitDemo
//
//  Created by LeoGege on 2/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LGGCategory)

// 剪切图片
- (UIImage *)LGG_scaleImageTosize:(CGSize)sizeMake;

// 把图片压缩到指定大小
- (NSData *)LGG_compressQualityWithMaxLength:(NSInteger)maxLength;

// 根据颜色创建图片
+ (UIImage *)LGG_imageWithColor:(UIColor *)color;

// 改变图片的颜色
- (UIImage *)LGG_changeColorWithColor:(UIColor *)color;
/**
 *从图片中按指定的位置大小截取图片的一部分
 * UIImage image 原始的图片
 * CGRect rect 要截取的区域
 */
+(UIImage *)LGG_imageFromImage:(UIImage *)image inRect:(CGRect)rect;

+ (UIImage *)LGG_imageFromView:(UIView *)view;


@end

NS_ASSUME_NONNULL_END

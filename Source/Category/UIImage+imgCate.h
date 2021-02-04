//
//  UIImage+imgCate.h
//  LJInStock
//
//  Created by 雷明 on 2020/8/20.
//  Copyright © 2020 fenyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (imgCate)

// 剪切图片
- (UIImage *)scaleImageTosize:(CGSize)sizeMake;

// 把图片压缩到指定大小
- (NSData *)compressQualityWithMaxLength:(NSInteger)maxLength;

// 根据颜色创建图片
+ (UIImage *)imageWithColor:(UIColor *)color;

// 改变图片的颜色
- (UIImage *)changeColorWithColor:(UIColor *)color;
/**
 *从图片中按指定的位置大小截取图片的一部分
 * UIImage image 原始的图片
 * CGRect rect 要截取的区域
 */
+(UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;

+ (UIImage *)imageFromView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END

//
//  UIColor+colorCate.h
//  LJInStock
//
//  Created by 雷明 on 2020/9/11.
//  Copyright © 2020 fenyun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, IHGradientChangeDirection) {

    IHGradientChangeDirectionLevel,                               //水平方向渐变

    IHGradientChangeDirectionVertical,                           //垂直方向渐变

    IHGradientChangeDirectionUpwardDiagonalLine,    //主对角线方向渐变

    IHGradientChangeDirectionDownDiagonalLine,       //副对角线方向渐变

};

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (colorCate)

/*

 size:渐变区域的尺寸

  direction:渐变方向

 startColor:开始颜色

   endColor:结束颜色

 */



+ (instancetype)lm_colorGradientChangeWithSize:(CGSize)size

                                     direction:(IHGradientChangeDirection)direction

                                    startColor:(UIColor*)startcolor

                                      endColor:(UIColor*)endColor;


@end

NS_ASSUME_NONNULL_END

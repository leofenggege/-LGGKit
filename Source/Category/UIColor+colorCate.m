//
//  UIColor+colorCate.m
//  LJInStock
//
//  Created by 雷明 on 2020/9/11.
//  Copyright © 2020 fenyun. All rights reserved.
//

#import "UIColor+colorCate.h"

@implementation UIColor (colorCate)

/*

 size:渐变区域的尺寸

  direction:渐变方向

 startColor:开始颜色

   endColor:结束颜色

 */



+ (instancetype)lm_colorGradientChangeWithSize:(CGSize)size

                                     direction:(IHGradientChangeDirection)direction

                                    startColor:(UIColor*)startcolor

                                      endColor:(UIColor*)endColor
{

   if(CGSizeEqualToSize(size,CGSizeZero) || !startcolor || !endColor) {

        return nil;

    }

   CAGradientLayer *gradientLayer = [CAGradientLayer layer];

    gradientLayer.frame=CGRectMake(0,0, size.width, size.height);



    CGPoint startPoint =CGPointZero;

    if (direction == IHGradientChangeDirectionDownDiagonalLine) {

        startPoint =CGPointMake(0.0,1.0);

    }

    gradientLayer.startPoint= startPoint;

   CGPoint endPoint = CGPointZero;

    switch(direction) {

        case IHGradientChangeDirectionLevel:

            endPoint =CGPointMake(1.0,0.0);

            break;

        case IHGradientChangeDirectionVertical:

            endPoint =CGPointMake(0.0,1.0);

            break;

        case IHGradientChangeDirectionUpwardDiagonalLine:

            endPoint =CGPointMake(1.0,1.0);

            break;

        case IHGradientChangeDirectionDownDiagonalLine:

            endPoint =CGPointMake(1.0,0.0);

            break;

        default:

            break;

    }

    gradientLayer.endPoint= endPoint;

    gradientLayer.colors=@[(__bridge id)startcolor.CGColor,(__bridge id)endColor.CGColor];

    UIGraphicsBeginImageContext(size);

    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];

    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return [UIColor colorWithPatternImage:image];

}

@end

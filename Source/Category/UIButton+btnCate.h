//
//  UIButton+btnCate.h
//  LJInStock
//
//  Created by 雷明 on 2020/8/24.
//  Copyright © 2020 fenyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    UIButtonAlignmentLeft,
    UIButtonAlignmentTop,
    UIButtonAlignmentRight,
    UIButtonAlignmentBottom
} UIButtonAlignment;


@interface UIButton (btnCate)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

- (void)layoutImageAndTitle:(UIButtonAlignment)alignment padding:(CGFloat)padding;


@end

NS_ASSUME_NONNULL_END

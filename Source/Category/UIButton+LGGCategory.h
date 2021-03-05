//
//  UIButton+LGGCategory.h
//  LGGKitDemo
//
//  Created by LeoGege on 3/2/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    UIButtonAlignmentLeft,
    UIButtonAlignmentTop,
    UIButtonAlignmentRight,
    UIButtonAlignmentBottom
} UIButtonAlignment;


@interface UIButton (LGGCategory)

- (void)LGG_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

- (void)LGG_layoutImageAndTitle:(UIButtonAlignment)alignment padding:(CGFloat)padding;

@end

NS_ASSUME_NONNULL_END

//
//  UIButton+LGGCategory.m
//  LGGKitDemo
//
//  Created by LeoGege on 3/2/21.
//

#import "UIButton+LGGCategory.h"

#import "UIImage+LGGCategory.h"



@implementation UIButton (LGGCategory)


- (void)LGG_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    
    UIImage *img = [UIImage LGG_imageWithColor:backgroundColor];

    [self setBackgroundImage:img forState:state];
}

- (void)LGG_layoutImageAndTitle:(UIButtonAlignment)alignment padding:(CGFloat)padding {
    if (self.imageView != nil && self.titleLabel != nil) {
        CGSize imgViewSize = self.imageView.frame.size;
        CGSize titleSize = self.titleLabel.frame.size;
        
        CGFloat totalHeight = imgViewSize.height + titleSize.height + padding;
        switch (alignment) {
            case UIButtonAlignmentTop:
                self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - imgViewSize.height), 0.0, 0.0, -titleSize.width);
                self.titleEdgeInsets = UIEdgeInsetsMake(0.0,
                                                        -imgViewSize.width,
                                                        -(totalHeight - titleSize.height),
                                                        0.0);
                break;
            case UIButtonAlignmentRight:
                //图片在右，文字在左
                self.imageEdgeInsets = UIEdgeInsetsMake(0.0,
                                                        titleSize.width + padding,
                                                        0.0,
                                                        -titleSize.width - padding);
                self.titleEdgeInsets = UIEdgeInsetsMake(0.0,
                                                        -imgViewSize.width - padding,
                                                        0.0,
                                                        imgViewSize.width + padding);
                break;
            case UIButtonAlignmentLeft:
                // 默认的
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0.0,
                                                         - padding / 2,
                                                        0.0,
                                                        padding / 2);
                self.titleEdgeInsets = UIEdgeInsetsMake(0.0,
                                                        padding / 2,
                                                        0.0,
                                                        - padding / 2);
                
                break;
            case UIButtonAlignmentBottom:
                self.imageEdgeInsets = UIEdgeInsetsMake(0.0,
                                                        0.0,
                                                        -(totalHeight - imgViewSize.height),
                                                        -titleSize.width);
                self.titleEdgeInsets = UIEdgeInsetsMake(-(totalHeight - titleSize.height),
                                                        -imgViewSize.width,
                                                        0.0,
                                                        0.0);
                break;
            default:
                break;
        }
    }
}


@end

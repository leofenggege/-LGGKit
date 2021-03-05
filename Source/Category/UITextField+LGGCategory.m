//
//  UITextField+LGGCategory.m
//  LGGKitDemo
//
//  Created by LeoGege on 3/2/21.
//

#import "UITextField+LGGCategory.h"

#import <objc/runtime.h>

static NSString const * const  adjust = @"adjust";

@implementation UITextField (LGGCategory)

-(void)setTintAjust:(CGFloat )tintAjust{
    objc_setAssociatedObject(self, &adjust, @(tintAjust), OBJC_ASSOCIATION_ASSIGN);
    UILabel * leftView = [[UILabel alloc] initWithFrame:CGRectMake(tintAjust,0,tintAjust,self.frame.size.height)];
    leftView.backgroundColor = [UIColor clearColor];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(CGFloat)tintAjust{
    id  value = objc_getAssociatedObject(self, &adjust);
    return  [value floatValue ];
}



@end

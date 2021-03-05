//
//  UIView+LGGCategory.h
//  LGGKitDemo
//
//  Created by LeoGege on 2/9/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LGGCategory)

@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat bottom;

@property(nonatomic) CGFloat x;
@property(nonatomic) CGFloat y;

@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;

@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;

@property(nonatomic) BOOL visible;

// 设置圆角 阴影
- (void)LGG_radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner;
- (void)LGG_createRectShadowWithOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;

// 移除所有子视图
- (void)LGG_removeAllSubviews;

// 视图生成图片
- (UIImage *)LGG_openglSnapshotImage;

// 底部展示提示
- (void)LGG_showToastInBottom:(NSString *)toastStr;

// 中心展示提示
- (void)LGG_showToasrInCenter:(NSString *)toastStr;

@end

NS_ASSUME_NONNULL_END

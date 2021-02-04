//
//  NSString+stringCate.h
//  LJInStock
//
//  Created by 雷明 on 2020/9/8.
//  Copyright © 2020 fenyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (stringCate)

- (CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize;


- (NSString *)becomeTimeString;
@end

NS_ASSUME_NONNULL_END

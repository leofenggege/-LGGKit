//
//  NSString+stringCate.m
//  LJInStock
//
//  Created by 雷明 on 2020/9/8.
//  Copyright © 2020 fenyun. All rights reserved.
//

#import "NSString+stringCate.h"

@implementation NSString (stringCate)

/**
 *  快速计算出文本的真实尺寸
 *
 *  @param font    文字的字体
 *  @param maxSize 文本的最大尺寸
 *
 *  @return 快速计算出文本的真实尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    NSDictionary *arrts = @{NSFontAttributeName:font};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:arrts context:nil].size;
}

- (NSString *)becomeTimeString {
    long long time=[self longLongValue];
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString*timeString = [formatter stringFromDate:date];
    return timeString;
}



@end

//
//  NSString+LGGCategory.h
//  LGGKitDemo
//
//  Created by LeoGege on 3/24/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LGGCategory)


/**base64加密*/
- (NSString *)LGG_base64Encode;
- (NSString *)LGG_base64DecodeString;

/** md5 一般加密 */
- (NSString *)LGG_md5String;

// 查看手机号码是否为有效手机号码
- (BOOL)LGG_validatePhoneNumber;

// 是否为有效邮箱
- (BOOL)LGG_validateEmail;

//判断字符串是否为空
- (BOOL)LGG_isEmpty;

// 根据宽度和字体得到高度
- (CGFloat)LGG_heightWithFont:(UIFont *)font MaxWidth:(float)width;

// 富文本（有行间距）的高度
-(CGFloat)LGG_HeightParagraphSpeace:(CGFloat)lineSpeace font:(UIFont*)font AndWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END

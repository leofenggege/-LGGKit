//
//  NSString+LGGCategory.m
//  LGGKitDemo
//
//  Created by LeoGege on 3/24/21.
//

#import "NSString+LGGCategory.h"
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import <sys/sysctl.h>
#import <mach/mach.h>

@implementation NSString (LGGCategory)

// base64
- (NSString *)LGG_base64Encode {
    //1、先转换成二进制数据
    NSData *data =[self dataUsingEncoding:NSUTF8StringEncoding];
    //2、对二进制数据进行base64编码，完成后返回字符串
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)LGG_base64DecodeString {
    //注意：该字符串是base64编码后的字符串
    //1、转换为二进制数据（完成了解码的过程）
    NSData *data=[[NSData alloc] initWithBase64EncodedString:self options:0];
    //2、把二进制数据转换成字符串
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

/** md5 一般加密 */
- (NSString *)LGG_md5String {
    const char *myPasswd = [self UTF8String];
    unsigned char mdc[16];
    CC_MD5(myPasswd, (CC_LONG)strlen(myPasswd), mdc);
    NSMutableString *md5String = [NSMutableString string];
    for (int i = 0; i< 16; i++) {
        [md5String appendFormat:@"%02x",mdc[i]];
    }
    return md5String;
}

// 查看手机号码是否为有效手机号码
- (BOOL)LGG_validatePhoneNumber {
    if (self.length < 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(166)|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(170)|(172)|(199)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:self];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:self];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:self];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
    return YES;
}

// 是否为有效邮箱
- (BOOL)LGG_validateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

//判断字符串是否为空
- (BOOL)LGG_isEmpty {
    if ([self isKindOfClass:[NSNull class]] || self == nil || [self length] < 1) {
        return YES;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0) {
            return YES;
        } else {
            return NO;
        }
    }
}

// 根据宽度和字体得到高度
- (CGFloat)LGG_heightWithFont:(UIFont *)font MaxWidth:(float)width{
    if (self.length==0) {
        return 0.0f;
    }
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesLineFragmentOrigin|
                   NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    
    return rect.size.height;
}

// 富文本（有行间距）的高度
-(CGFloat)LGG_HeightParagraphSpeace:(CGFloat)lineSpeace font:(UIFont*)font AndWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f };
    CGSize size = [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}


@end

//
//  UIColor+LGGCategory.m
//  LGGKitDemo
//
//  Created by LeoGege on 3/24/21.
//

#import "UIColor+LGGCategory.h"

@implementation UIColor (LGGCategory)


+ (UIColor *)LGG_ColorWithString:(NSString *)hexString {
    return [[self class] LGG_ColorWithString:hexString alpha:1.0];
}

+ (UIColor *)LGG_ColorWithString:(NSString *)hexString alpha:(CGFloat)alpha {
    // 我们发现了一个空字符串，我们没有返回任何东西
    if (hexString.length == 0) {
        return nil;
    }
    
    // 检查哈希并添加缺失的哈希
    if('#' != [hexString characterAtIndex:0]) {
        hexString = [NSString stringWithFormat:@"#%@", hexString];
    }
    
    // 在错误的alpha值上不返回任何对象
    NSArray *validHexStringLengths = @[@4, @5, @7, @9];
    NSNumber *hexStringLengthNumber = [NSNumber numberWithUnsignedInteger:hexString.length];
    if ([validHexStringLengths indexOfObject:hexStringLengthNumber] == NSNotFound) {
        return nil;
    }
    
    // 如果十六进制字符串是5或9，我们将忽略alpha值，而使用十六进制字符串的值代替
    CGFloat handedInAlpha = alpha;
    if (5 == hexString.length || 9 == hexString.length) {
        NSString *alphaHex;
        if (5 == hexString.length) {
            alphaHex = [hexString substringWithRange:NSMakeRange(4, 1)];
        } else {
            alphaHex = [hexString substringWithRange:NSMakeRange(7, 2)];
        }
        if (1 == alphaHex.length) alphaHex = [NSString stringWithFormat:@"%@%@", alphaHex, alphaHex];
        //hexString = [NSString stringWithFormat:@"#%@", [hexString substringFromIndex:9 == hexString.length ? 7 : 3]];
        hexString = [NSString stringWithFormat:@"#%@", [hexString substringWithRange:NSMakeRange(1, 9 == hexString.length ? 6 : 3)]];
        unsigned alpha_u = [[self class] LGG_HexValueToUnsigned:alphaHex];
        handedInAlpha = ((CGFloat) alpha_u) / 255.0;
    }
    
    // 检查3个字符的HexStrings
    hexString = [hexString LGG_HexStringTransformFromThreeCharacters];
    
    NSString *redHex    = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(1, 2)]];
    unsigned redInt = [[self class] LGG_HexValueToUnsigned:redHex];
    
    NSString *greenHex  = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(3, 2)]];
    unsigned greenInt = [[self class] LGG_HexValueToUnsigned:greenHex];
    
    NSString *blueHex   = [NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(5, 2)]];
    unsigned blueInt = [[self class] LGG_HexValueToUnsigned:blueHex];
    
    UIColor *color = [UIColor LGG_ColorWith8BitRed:redInt green:greenInt blue:blueInt alpha:handedInAlpha];
    
    return color;
}


+ (UIColor *)LGG_ColorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [[self class] LGG_ColorWith8BitRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)LGG_ColorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    UIColor *color = nil;
#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
    color = [UIColor colorWithRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:alpha];
#else
    color = [UIColor colorWithCalibratedRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:alpha];
#endif
    
    return color;
}


+ (unsigned)LGG_HexValueToUnsigned:(NSString *)hexValue {
    unsigned value = 0;
    
    NSScanner *hexValueScanner = [NSScanner scannerWithString:hexValue];
    [hexValueScanner scanHexInt:&value];
    
    return value;
}


UIColor * LGGRGBColor(NSInteger r,NSInteger g,NSInteger b) {
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}
UIColor * LGGRGBColorWithAlpha(NSInteger r,NSInteger g,NSInteger b,CGFloat alpha) {
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}
UIColor *  LGGHexColor(NSString *hexString) {
    return [UIColor LGG_ColorWithString:hexString];
}

UIColor * LGGHexColorWithAlpha(NSString *hexString,CGFloat alpha) {
    return [UIColor LGG_ColorWithString:hexString alpha:alpha];
}

@end


@implementation NSString (LGG_StringTansformer)

- (NSString *)LGG_HexStringTransformFromThreeCharacters {
    if(self.length == 4)
    {
        NSString * hexString = [NSString stringWithFormat:@"#%1$c%1$c%2$c%2$c%3$c%3$c",
                                [self characterAtIndex:1],
                                [self characterAtIndex:2],
                                [self characterAtIndex:3]];
        return hexString;
    }
    
    return self;
}

@end


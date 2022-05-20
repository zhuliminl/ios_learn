//
//  UIColor+Hexadecimal.m
//  saulTest
//
//  Created by 朱黎明 on 2022/4/23.
//

#import "UIColor_Hexadecimal.h"

@implementation UIColor(Hexadecimal)
+ (UIColor *)colorWithHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
@end

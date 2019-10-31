//
//  NSString+DecimalNumber.h
//  iOS108General
//
//  Created by 东健 on 2019/10/29.
//  Copyright © 2019 iOS108. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 内部方法实现适用于高精度数据计算，建议在日常场景使用 string.floatValue等方法即可
 
 NSRoundingMode 精度计算类型
 
 NSRoundPlain,   // 严格遵守四舍五入
 NSRoundDown,    // 直接舍去
 NSRoundUp,      // 直接进一位
 NSRoundBankers  // 进位标准同方法一
 */

@interface NSString (DecimalNumber)

/// 字符串转 Float 时保留 N 位小数，返回值是字符串
/// @param scale 需要保留的小数位数，当传入小数不足精度位数时，例如 5.6 精度为 2 时，仍然只会返回 5.6，而不是5.60
/// @param roundMode 在保留小数时采用的规则，如四舍五入传 NSRoundPlain
- (NSString *)floatValueWithScale:(int)scale type:(NSRoundingMode)roundMode;

/// 自身的常量值减去传入字符串常量值
/// @param str 需要比较的字符串
- (double)subtractingWithString:(NSString *)str;

/// 自身的常量值减去传入字符串常量值
/// @param str 需要比较的字符串
/// @param scale 精度范围，例如 1.56 与 1.563 在 2 位小数精度范围内，比较规则为 四舍五入的情况下，他们的差值为 0
/// @param roundMode 在保留小数时采用的规则，如四舍五入传 NSRoundPlain
- (double)subtractingWithString:(NSString *)str scale:(int)scale type:(NSRoundingMode)roundMode;

/// 自身的常量值加上传入字符串常量值
/// @param str 需要相加的字符串
- (double)addingWithString:(NSString *)str;

/// 自身的常量值加上传入字符串常量值
/// @param str 需要相加的字符串
/// @param scale 精度范围，例如 1.2 与 1.21 在 1 位小数精度范围内，比较规则为 四舍五入的情况下，他们的和为 2.4
/// @param roundMode 在保留小数时采用的规则，如四舍五入传 NSRoundPlain
- (double)addingWithString:(NSString *)str scale:(int)scale type:(NSRoundingMode)roundMode;

@end

NS_ASSUME_NONNULL_END

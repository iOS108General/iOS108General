//
//  NSString+DecimalNumber.h
//  iOS108General
//
//  Created by 东健 on 2019/10/29.
//  Copyright © 2019 iOS108. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/** 内部方法实现适用于高精度数据计算，建议在日常场景使用 string.floatValue等方法即可 */
@interface NSString (DecimalNumber)

// 字符串转 Float 时保留 N 位小数，返回值是字符串

// 字符串比较值的 大小，返回值为bool

// 字符串直接相减或相加,并返回结果，类型为字符串，可定在 N 为小数范围内进行加减，例如 @"1.554" 与 @"1.545" 若定为 2位小数 以内加减，则结果为 0，会对传入字符串进行四舍五入后计算



@end

NS_ASSUME_NONNULL_END

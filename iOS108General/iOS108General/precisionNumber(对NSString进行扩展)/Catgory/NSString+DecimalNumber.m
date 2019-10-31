//
//  NSString+DecimalNumber.m
//  iOS108General
//
//  Created by 东健 on 2019/10/29.
//  Copyright © 2019 iOS108. All rights reserved.
//

#import "NSString+DecimalNumber.h"

@implementation NSString (DecimalNumber)

// 字符串转 Float 时保留 N 位小数，返回值是字符串
- (NSString *)floatValueWithScale:(int)scale type:(NSRoundingMode)roundMode
{
    NSString *params = [NSString checkParamsIsNomal:self];
    NSDecimalNumber *num = [NSDecimalNumber decimalNumberWithString:params];
    NSDecimalNumberHandler *numHandler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundMode scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    return [[num decimalNumberByRoundingAccordingToBehavior:numHandler] stringValue];
}

// 当前字符串与传入字符串的常量值的差
- (double)subtractingWithString:(NSString *)str
{
    NSString *paramsOne = [NSString checkParamsIsNomal:self];
    NSString *paramsTwo = [NSString checkParamsIsNomal:str];
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:paramsOne];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:paramsTwo];
    NSDecimalNumber *valueNum = [num1 decimalNumberBySubtracting:num2];
    return valueNum.doubleValue;
}

// 当前字符串与传入字符串的常量值的差
- (double)subtractingWithString:(NSString *)str scale:(int)scale type:(NSRoundingMode)roundMode
{
    NSString *paramsOne = [NSString checkParamsIsNomal:self];
    NSString *paramsTwo = [NSString checkParamsIsNomal:str];
    
    NSDecimalNumberHandler *numHandler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundMode scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:paramsOne];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:paramsTwo];
    
    num1 = [num1 decimalNumberByRoundingAccordingToBehavior:numHandler];
    num2 = [num2 decimalNumberByRoundingAccordingToBehavior:numHandler];
    
    NSDecimalNumber *valueNum = [num1 decimalNumberBySubtracting:num2 withBehavior:numHandler];
    return valueNum.doubleValue;
}

// 自身的常量值加上传入字符串常量值
- (double)addingWithString:(NSString *)str
{
    NSString *paramsOne = [NSString checkParamsIsNomal:self];
    NSString *paramsTwo = [NSString checkParamsIsNomal:str];
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:paramsOne];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:paramsTwo];
    NSDecimalNumber *valueNum = [num1 decimalNumberByAdding:num2];
    return valueNum.doubleValue;
}

// 自身的常量值加上传入字符串常量值
- (double)addingWithString:(NSString *)str scale:(int)scale type:(NSRoundingMode)roundMode
{
    NSString *paramsOne = [NSString checkParamsIsNomal:self];
    NSString *paramsTwo = [NSString checkParamsIsNomal:str];
    
    NSDecimalNumberHandler *numHandler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundMode scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:paramsOne];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:paramsTwo];
    
    num1 = [num1 decimalNumberByRoundingAccordingToBehavior:numHandler];
    num2 = [num2 decimalNumberByRoundingAccordingToBehavior:numHandler];
    
    NSDecimalNumber *valueNum = [num1 decimalNumberByAdding:num2 withBehavior:numHandler];
    return valueNum.doubleValue;
}

#pragma mark - 校验数据是否合法并返回合法的参数
+ (NSString *)checkParamsIsNomal:(NSString *)params
{
    if ([params isKindOfClass:[NSString class]]) {
        if (params.length == 0) {
            return @"0";
        } else {
            NSString *str = [NSString checkParamsIsNumber:params];
            if (str.length != params.length) {
                return str;
            }
            return params;
        }
    } else {
        return @"0";
    }
}

#pragma mark - 提取数字以及小数点部分，可以为负数
+ (NSString *)checkParamsIsNumber:(NSString *)params
{
    NSCharacterSet *numberSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890.-"] invertedSet];
    NSString *filtered = [[params componentsSeparatedByCharactersInSet:numberSet] componentsJoinedByString:@""];
    if (filtered.length == 0) {
        return @"0";
    }
    return filtered;
}

@end

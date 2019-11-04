//
// UITextField+Format.h
// MyBus //
// Created by XM_Monkey on 2019/11/1.
// Copyright © 2019 XM_Monkey. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UITextField (Format)

/**例例⼦子 实现UITextField的如下代理理
 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
 eg:1
 return [textField textFieldShouldChangeCharactersInRange:range replacementString:string blankLocations:@[@4,@9,@14,@19,@24] limitCount:0];
 eg:2
 return [textField textFieldShouldChangeCharactersInRange:range replacementString:string replaceLocation:4 limitCount:0];
 } */

/** textField中输⼊的空格格式化
 @param textField 格式化的输⼊框
 @param range 输⼊框变化的范围
 @param string 输⼊框变化的字符
 @param blankLocation 要加的空格的位置 ⽐比如⼿手机号11 位 如果需要 344的显示格式 空格位置就是
 @[@4,@9]
 身份证号最⼤大 18位 684格式 空格位置 位@[@6,@15]
 银⾏行行卡号最⼤大 24 空格位置 @[@4,@9,@14,@19,@24] 不不同的账号显示格式可以⾃自定义
 @param limitCount 限制的⻓度 超过此限制⻓度 则不不能输⼊ 如果输⼊的为0 则不显示输⼊的⻓度
 @return 操作返回BOOL值
 */
+ (BOOL)inputTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
        blankLocations:(NSArray <NSNumber *>*)blankLocation limitCount:(NSInteger )limitCount;
/**
 UITextField 输⼊⽂本显示格式()
 @param textField 格式化的输⼊框
 @param range 输⼊框变化的范围
 @param string 输⼊框变化的字符
 @param location 变化的格式位数(每隔几位后添加空格)
 @param limitCount 限制的⻓度 超过此限制⻓度 则不能输⼊ 如果输入的为0 则不显示输入的长度
 @return 操作返回BOOL值
 */
+ (BOOL)inputTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
     replacementString:(NSString *)string location:(NSInteger)location
            limitCount:(NSInteger )limitCount;
/**
 textField中输⼊的空格格式化
 @param range 输⼊框变化的范围
 @param string 输⼊框变化的字符
 @param blankLocation 要加的空格的位置 ⽐比如⼿手机号11 位 如果需要 344的显示格式 空格位置就是
 @[@4,@9]
 身份证号最⼤大 18位 684格式 空格位置 位@[@6,@15]
 银⾏行行卡号最⼤大 24 空格位置 @[@4,@9,@14,@19,@24] 不不同的账号显示格式可以⾃自定义 @param limitCount 限制的⻓度 超过此限制⻓度 则不不能输⼊ 如果输⼊的为0 则不显示输⼊的⻓度 @return 操作返回BOOL值
 */
- (BOOL)textFieldShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
                                blankLocations:(NSArray <NSNumber *>*)blankLocation limitCount:(NSInteger )limitCount;
/**
 UITextField 输⼊⽂本显示格式()
 @param range 输⼊框变化的范围
 @param string 输⼊框变化的字符
 @param location 变化的格式位数(每隔⼏位后添加空格)
 @param limitCount 限制的⻓度 超过此限制⻓度 则不不能输⼊ 如果输⼊的为0 则不显示输⼊的⻓度 @return 操作返回BOOL值
 */
- (BOOL)textFieldShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
                                      location:(NSInteger)location limitCount:(NSInteger )limitCount;
@end
NS_ASSUME_NONNULL_END

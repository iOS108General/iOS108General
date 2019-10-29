//
//  UIApplication+CheckInput.m
//  DouShanSwift
//
//  Created by 东健 on 2019/10/7.
//  Copyright © 2019 qwang. All rights reserved.
//

#import "UIApplication+CheckInput.h"
#import "UITextField+CheckInput.h"
#import "UITextView+CheckInput.h"

@implementation UIApplication (CheckInput)

- (void)inputUnlawfulnessShowMessageToWindow:(NSString *)string
{
    if (string.length) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:string delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
    }
}

// MARK: -
// MARK: UITextView 输入检测
- (void)textViewInputChange:(NSNotification *)noti
{
    UITextView *textView = noti.object;
    [self checkInputData:(id)textView];
}

// MARK: -
// MARK: UITextField 输入检测
- (void)textFieldInputChange:(NSNotification *)noti
{
    UITextField *textField = noti.object;
    [self checkInputData:(id)textField];
}

/**
 共同的检测逻辑，注意这里的 textView 可能会是 UITextView 或者 UITextField
 需要 UITextField+CheckInput UITextView+CheckInput 两个文件中属性名称一致，否则会崩溃
 */
- (void)checkInputData:(UITextField *)textView
{
    UITextRange *selectedRange = [textView markedTextRange];
    UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
    // 如果含有高亮部分，表示用户输入未结束，不参与后续检测逻辑
    if (position) return;
    
    NSMutableArray *toastMessage = [NSMutableArray array];
    NSString *nowInputData = [NSString stringWithFormat:@"%@",textView.text];
    NSString *checkData = nowInputData;
    // 检测符号
    if (textView.cannotInputSymbol) {
        checkData = [self cheackInputSymbol:nowInputData];
        //        textView.text = checkData;
        [textView setValue:checkData forKey:@"text"];
        if (nowInputData.length > checkData.length) {
            !textView.inputSymbolDec ?: [toastMessage addObject:textView.inputSymbolDec];
        }
        nowInputData = checkData;
    } else {
        [textView setValue:checkData forKey:@"text"];
        nowInputData = checkData;
    }
    
    // 检测表情
    if (textView.cannotInputEmoji) {
        checkData = [self cheackInputEmoji:nowInputData];
        [textView setValue:checkData forKey:@"text"];
        if (nowInputData.length > checkData.length) {
            !textView.inputEmojiDec ?: [toastMessage addObject:textView.inputEmojiDec];
        }
        nowInputData = checkData;
    } else {
        [textView setValue:checkData forKey:@"text"];
        nowInputData = checkData;
    }
    
    // 检测是否为中文
    if (textView.cannotInputChinese) {
        // 只检测非高亮部分
        checkData = [self cheackInputChinese:nowInputData];
        [textView setValue:checkData forKey:@"text"];
        if (nowInputData.length > checkData.length) {
            !textView.inputChineseDec ?: [toastMessage addObject:textView.inputChineseDec];
        }
        nowInputData = checkData;
    } else {
        [textView setValue:checkData forKey:@"text"];
        nowInputData = checkData;
    }
    
    // 检测数字
    if (textView.canOnlyInputNumber) {
        checkData = [self checkInputIsNumber:nowInputData];
        [textView setValue:checkData forKey:@"text"];
        if (nowInputData.length > checkData.length) {
            !textView.inputNumberDec ?: [toastMessage addObject:textView.inputNumberDec];
        }
        nowInputData = checkData;
    } else {
        [textView setValue:checkData forKey:@"text"];
        nowInputData = checkData;
    }
    
    // 检测是否为订单号
    if (textView.canOnlyInputOrderNumber) {
        checkData = [self checkInputIsOrderNumber:nowInputData];
        [textView setValue:checkData forKey:@"text"];
        if (nowInputData.length > checkData.length) {
            !textView.inputOrderNumberDec ?: [toastMessage addObject:textView.inputOrderNumberDec];
        }
        nowInputData = checkData;
    } else {
        [textView setValue:checkData forKey:@"text"];
        nowInputData = checkData;
    }
    
    [self inputUnlawfulnessShowMessageToWindow:[toastMessage componentsJoinedByString:@","]];
}

// MARK: -
// MARK: 符号输入检测方法
- (NSString *)cheackInputSymbol:(NSString *)inputText
{
    NSString *userInputData = [NSString stringWithString:inputText];
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"[]{}（+-_=）\\|(＜＞$%^&*#@~`?)+ "];
    NSString *newString = [[userInputData componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString: @""];
    return newString;
}

// MARK: -
// MARK: Emoji表情输入检测方法
- (NSString *)cheackInputEmoji:(NSString *)inputText
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:inputText
                                                               options:0
                                                                 range:NSMakeRange(0, [inputText length])
                                                          withTemplate:@""];
    return modifiedString;
}

// MARK: -
// MARK: 中文输入检测方法
- (NSString *)cheackInputChinese:(NSString *)inputText
{
    NSString *returnData = @"";
    for(int i=0; i< [inputText length];i++){
        unichar a = [inputText characterAtIndex:i];
        NSString *subString = [inputText substringWithRange:NSMakeRange(i, 1)];
        if(a >= 0x4e00 && a <= 0x9fff){
            //为中文
        } else {
            returnData = [returnData stringByAppendingString:subString];
        }
    }
    return returnData;
}

// MARK: -
// MARK: 数字【包含小数点】输入检测方法
- (NSString *)checkInputIsNumber:(NSString *)inputText
{
    NSCharacterSet *numberSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890."] invertedSet];
    NSString *filtered = [[inputText componentsSeparatedByCharactersInSet:numberSet] componentsJoinedByString:@""];
    return filtered;
}

// MARK: -
// MARK: 字母数字下划线中横杠小数点输入检测方法
- (NSString *)checkInputIsOrderNumber:(NSString *)inputText
{
    NSCharacterSet *numberSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890abcdefghijklmnopqrstuvwxyzQWERTYUIOPLKJHGFDSAZXCVBNM._-"] invertedSet];
    NSString *filtered = [[inputText componentsSeparatedByCharactersInSet:numberSet] componentsJoinedByString:@""];
    return filtered;
}

@end

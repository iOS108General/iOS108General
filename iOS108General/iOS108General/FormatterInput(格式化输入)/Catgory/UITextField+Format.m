//
// UITextField+Format.h
// MyBus //
// Created by XM_Monkey on 2019/11/1.
// Copyright © 2019 XM_Monkey. All rights reserved.

#import "UITextField+Format.h"

@implementation UITextField (Format)

+ (BOOL)inputTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
        blankLocations:(NSArray<NSNumber *> *)blankLocation limitCount:(NSInteger)limitCount {
    
    return [textField textFieldShouldChangeCharactersInRange:range replacementString:string blankLocations:blankLocation limitCount:limitCount];
}
-(BOOL)textFieldShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string blankLocations:(NSArray<NSNumber *> *)blankLocation limitCount:(NSInteger)limitCount{
    BOOL limit = YES; if (limitCount == 0) {
        limit = NO; }
    NSString *text = self.text;
    if ([string isEqualToString:@""]) { // 删除
        if (range.length == 1) {// 删除⼀一位
            if (range.location == text.length - 1) {
                // location是下标 此句句表示删除的最后⼀一位
                return YES;
            } else { // 不不是最后⼀一位
                NSInteger offset = range.location;
                if (range.location < text.length && [text characterAtIndex:range.location] == ' ' && [self.selectedTextRange isEmpty]) {
                    [self deleteBackward];
                    offset --; }
                ///删除光标前的字符
                [self deleteBackward];
                self.text = [self insertStringBlankLocations:blankLocation]; //设置光标的位置
                [self setCursorLocationOffset:offset];
                return NO;
            }
        } else if (range.length > 1) {
            BOOL lastOne = NO;
            if (range.location + range.length == text.length) {
                //是否是最后⼀一位
                lastOne = YES; }
            
            [self deleteBackward];
            self.text = [self insertStringBlankLocations:blankLocation]; NSInteger offset = range.location;
            if (lastOne) {
                // 最后⼀一个不不需要设置光标 } else {
                [self setCursorLocationOffset:offset]; }
            return NO; } else {
                return YES; }
    } else if (string.length > 0) { if (limit) {
        if ([self removeBlank].length + string.length - range.length > limitCount ) {
            // [self whiteSpaseString:textField.text].length ⽬目前textfield中有的 内容的⻓长度 string.length 即将加⼊入的内容的⻓长度 range.length
            return NO;
        } }
    }
    [self insertText:string];
    self.text = [self insertStringBlankLocations:blankLocation]; NSInteger offset = range.location + string.length;
    for (NSNumber *location in blankLocation) {
        if (range.location == location.integerValue) {
            offset ++; }
    }
    [self setCursorLocationOffset:offset]; return NO;
}

+(BOOL)inputTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string location:(NSInteger)location limitCount:(NSInteger)limitCount{
    return [textField textFieldShouldChangeCharactersInRange:range replacementString:string location:location limitCount:limitCount];
}

-(BOOL)textFieldShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string location:(NSInteger)location limitCount:(NSInteger)limitCount{
    BOOL limit = YES; if (limitCount == 0) {
        limit = NO; }
    NSString *text = self.text;
    if ([string isEqualToString:@""]) { // 删除
        
        if (range.length == 1) {// 删除⼀一位
            if (range.location == text.length - 1) {
                // location是下标 此句句表示删除的最后⼀一位
                return YES;
            } else { // 不不是最后⼀一位
                NSInteger offset = range.location;
                if (range.location < text.length && [text characterAtIndex:range.location] == ' ' && [self.selectedTextRange isEmpty]) {
                    [self deleteBackward];
                    offset --; }
                [self deleteBackward];
                self.text = [self insertStringlocation:location]; //设置光标的位置
                [self setCursorLocationOffset:offset];
                return NO;
            }
        } else if (range.length > 1) {
            BOOL lastOne = NO;
            if (range.location + range.length == text.length) {
                //是否是最后⼀一位
                lastOne = YES; }
            ///删除光标前的字符 [self deleteBackward];
            self.text = [self insertStringlocation:location]; NSInteger offset = range.location;
            if (lastOne) {
                // 最后⼀一个不不需要设置光标 } else {
                [self setCursorLocationOffset:offset]; }
            return NO; } else {
                return YES; }
    } else if (string.length > 0) { if (limit) {
        if ([self removeBlank].length + string.length - range.length > limitCount ) {
            // [self whiteSpaseString:textField.text].length ⽬目前textfield中有的 内容的⻓长度 string.length 即将加⼊入的内容的⻓长度 range.length
            return NO;
        } }
    }
    [self insertText:string];
    self.text = [self insertStringlocation:location]; NSInteger offset = range.location + string.length; NSInteger div = self.text.length / (location + 1); for (int i = 0; i < div; i++) {
        NSInteger index = location + i * (location + 1);
        
        if (range.location == index) { offset ++;
        } }
    [self setCursorLocationOffset:offset];
    return NO;
}

///在指定的位置添加空格
-(NSString*)insertStringlocation:(NSInteger)location {
    NSString *text = [self.text stringByReplacingOccurrencesOfString:@" " withString:@""]; NSMutableString* mutableString = [NSMutableString stringWithString:text]; NSUInteger div = text.length / location;
    // NSUInteger rem = text.length % location;
    for (int i = 0; i < div; i++) {
        NSUInteger index = location + i * (location + 1); [mutableString insertString:@" " atIndex:index];
    }
    return mutableString;
    
}

///在指定的位置添加空格
-(NSString*)insertStringBlankLocations:(NSArray<NSNumber *>*)locations {
    NSMutableString* mutableString = [NSMutableString stringWithString:[self.text stringByReplacingOccurrencesOfString:@" " withString:@""]];
    for (NSNumber *location in locations) {
        if (mutableString.length > location.integerValue) {
            [mutableString insertString:@" " atIndex:location.integerValue]; }
    }
    return mutableString;
    
}

///去除空格
-(NSString *)removeBlank{
    return [self.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
}
///设置光标
-(void)setCursorLocationOffset:(NSInteger)offset{
    UITextPosition *newPostion = [self positionFromPosition:self.beginningOfDocument offset:offset] ;
    self.selectedTextRange = [self textRangeFromPosition:newPostion toPosition:newPostion];
    
}
@end

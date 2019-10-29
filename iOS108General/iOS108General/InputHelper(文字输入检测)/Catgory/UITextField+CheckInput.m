//
//  UITextField+CheckInput.m
//  DouShanSwift
//
//  Created by 东健 on 2019/9/26.
//  Copyright © 2019 qwang. All rights reserved.
/*
 ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 ⚠️         所有功能只要设置任意属性为YES即可生效         ⚠️
 ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 */

#import "UITextField+CheckInput.h"
#import <objc/runtime.h>

@interface UITextField ()
@property (nonatomic, assign) BOOL addAction;
@end

@implementation UITextField (CheckInput)

- (void)addInputObseverAction{
    [[NSNotificationCenter defaultCenter] addObserver:[UIApplication sharedApplication] selector:@selector(textFieldInputChange:) name:UITextFieldTextDidChangeNotification object:self];
}

#pragma mark - Getter And Setter
- (BOOL)cannotInputSymbol
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCannotInputSymbol:(BOOL)cannotInputSymbol
{
    objc_setAssociatedObject(self, @selector(cannotInputSymbol) ,@(cannotInputSymbol), OBJC_ASSOCIATION_ASSIGN);
    if (cannotInputSymbol) {
        if (!self.addAction) {
            self.addAction = YES;
            [self addInputObseverAction];
        }
    }
}

- (BOOL)cannotInputEmoji
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCannotInputEmoji:(BOOL)cannotInputEmoji
{
    objc_setAssociatedObject(self, @selector(cannotInputEmoji) ,@(cannotInputEmoji), OBJC_ASSOCIATION_ASSIGN);
    if (cannotInputEmoji) {
        if (!self.addAction) {
            self.addAction = YES;
            [self addInputObseverAction];
        }
    }
}

- (BOOL)cannotInputChinese
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCannotInputChinese:(BOOL)cannotInputChinese
{
    objc_setAssociatedObject(self, @selector(cannotInputChinese) ,@(cannotInputChinese), OBJC_ASSOCIATION_ASSIGN);
    if (cannotInputChinese) {
        if (!self.addAction) {
            self.addAction = YES;
            [self addInputObseverAction];
        }
    }
}

- (BOOL)canOnlyInputNumber
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCanOnlyInputNumber:(BOOL)canOnlyInputNumber
{
    objc_setAssociatedObject(self, @selector(canOnlyInputNumber) ,@(canOnlyInputNumber), OBJC_ASSOCIATION_ASSIGN);
    if (canOnlyInputNumber) {
        if (!self.addAction) {
            self.addAction = YES;
            [self addInputObseverAction];
        }
    }
}

- (BOOL)canOnlyInputOrderNumber
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCanOnlyInputOrderNumber:(BOOL)canOnlyInputOrderNumber
{
    objc_setAssociatedObject(self, @selector(canOnlyInputOrderNumber) ,@(canOnlyInputOrderNumber), OBJC_ASSOCIATION_ASSIGN);
    if (canOnlyInputOrderNumber) {
        if (!self.addAction) {
            self.addAction = YES;
            [self addInputObseverAction];
        }
    }
}

- (BOOL)addAction
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setAddAction:(BOOL)addAction
{
    objc_setAssociatedObject(self, @selector(addAction) ,@(addAction), OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)inputSymbolDec
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setInputSymbolDec:(NSString *)inputSymbolDec
{
    objc_setAssociatedObject(self, @selector(inputSymbolDec) ,inputSymbolDec, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)inputEmojiDec
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setInputEmojiDec:(NSString *)inputEmojiDec
{
    objc_setAssociatedObject(self, @selector(inputEmojiDec) ,inputEmojiDec, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)inputChineseDec
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setInputChineseDec:(NSString *)inputChineseDec
{
    objc_setAssociatedObject(self, @selector(inputChineseDec) ,inputChineseDec, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)inputNumberDec
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setInputNumberDec:(NSString *)inputNumberDec
{
    objc_setAssociatedObject(self, @selector(inputNumberDec) ,inputNumberDec, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)inputOrderNumberDec
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setInputOrderNumberDec:(NSString *)inputOrderNumberDec
{
    objc_setAssociatedObject(self, @selector(inputOrderNumberDec) ,inputOrderNumberDec, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

//
//  UIView+CheckInput.m
//  DouShanSwift
//
//  Created by 东健 on 2019/12/6.
//  Copyright © 2019 qwang. All rights reserved.
//

#import "UIView+CheckInput.h"
#import <objc/runtime.h>
@interface UIView ()
@property (nonatomic, assign) BOOL addAction;
@end

@implementation UIView (CheckInput)

- (void)addInputObseverAction{
    if (![self checkClass]) {
        return;
    }
    if ([self isKindOfClass:[UITextField class]]) {
        [[NSNotificationCenter defaultCenter] addObserver:[UIApplication sharedApplication] selector:@selector(textFieldInputChange:) name:UITextFieldTextDidChangeNotification object:self];
    }
    
    if ([self isKindOfClass:[UITextView class]]) {
        [[NSNotificationCenter defaultCenter] addObserver:[UIApplication sharedApplication] selector:@selector(textViewInputChange:) name:UITextViewTextDidChangeNotification object:self];
    }
    
}

#pragma mark - Getter And Setter
- (BOOL)cannotInputSymbol
{
    if (![self checkClass]) {
        return NO;
    }
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCannotInputSymbol:(BOOL)cannotInputSymbol
{
    if (![self checkClass]) {
        return;
    }
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
    if (![self checkClass]) {
        return NO;
    }
    return YES;
//    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCannotInputEmoji:(BOOL)cannotInputEmoji
{
    if (![self checkClass]) {
        return;
    }
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
    if (![self checkClass]) {
        return NO;
    }
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCannotInputChinese:(BOOL)cannotInputChinese
{
    if (![self checkClass]) {
        return;
    }
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
    if (![self checkClass]) {
        return NO;
    }
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCanOnlyInputNumber:(BOOL)canOnlyInputNumber
{
    if (![self checkClass]) {
        return;
    }
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
    if (![self checkClass]) {
        return NO;
    }
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCanOnlyInputOrderNumber:(BOOL)canOnlyInputOrderNumber
{
    if (![self checkClass]) {
        return;
    }
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
    if (![self checkClass]) {
        return NO;
    }
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setAddAction:(BOOL)addAction
{
    if (![self checkClass]) {
        return;
    }
    objc_setAssociatedObject(self, @selector(addAction) ,@(addAction), OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)inputSymbolDec
{
    if (![self checkClass]) {
        return @"";
    }
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setInputSymbolDec:(NSString *)inputSymbolDec
{
    if (![self checkClass]) {
        return;
    }
    objc_setAssociatedObject(self, @selector(inputSymbolDec) ,inputSymbolDec, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)inputEmojiDec
{
    if (![self checkClass]) {
        return @"";
    }
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setInputEmojiDec:(NSString *)inputEmojiDec
{
    if (![self checkClass]) {
        return;
    }
    objc_setAssociatedObject(self, @selector(inputEmojiDec) ,inputEmojiDec, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)inputChineseDec
{
    if (![self checkClass]) {
        return @"";
    }
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setInputChineseDec:(NSString *)inputChineseDec
{
    if (![self checkClass]) {
        return;
    }
    objc_setAssociatedObject(self, @selector(inputChineseDec) ,inputChineseDec, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)inputNumberDec
{
    if (![self checkClass]) {
        return @"";
    }
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setInputNumberDec:(NSString *)inputNumberDec
{
    if (![self checkClass]) {
        return;
    }
    objc_setAssociatedObject(self, @selector(inputNumberDec) ,inputNumberDec, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)inputOrderNumberDec
{
    if (![self checkClass]) {
        return @"";
    }
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setInputOrderNumberDec:(NSString *)inputOrderNumberDec
{
    if (![self checkClass]) {
        return;
    }
    objc_setAssociatedObject(self, @selector(inputOrderNumberDec) ,inputOrderNumberDec, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setInputMaxCount:(NSInteger)inputMaxCount
{
    if (![self checkClass]) {
        return;
    }
    objc_setAssociatedObject(self, @selector(inputMaxCount) ,@(inputMaxCount), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)inputMaxCount
{
    if (![self checkClass]) {
        return 0;
    }
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setCustomRules:(NSString *)customRules
{
    if (![self checkClass]) {
        return;
    }
    objc_setAssociatedObject(self, @selector(customRules) ,customRules, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)customRules
{
    if (![self checkClass]) {
        return @"";
    }
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCustomRulesDec:(NSString *)customRulesDec
{
    if (![self checkClass]) {
        return;
    }
    objc_setAssociatedObject(self, @selector(customRulesDec) ,customRulesDec, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)customRulesDec
{
    if (![self checkClass]) {
        return @"";
    }
    return objc_getAssociatedObject(self, _cmd);
}

- (BOOL)checkClass
{
    if ([self isKindOfClass:[UITextField class]] || ([self isKindOfClass:[UITextView class]])) {
        return YES;
    }
    return NO;
}

@end

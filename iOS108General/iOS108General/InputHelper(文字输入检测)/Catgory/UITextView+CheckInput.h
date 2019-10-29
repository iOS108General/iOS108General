//
//  UITextView+CheckInput.h
//  DouShanSwift
//
//  Created by 东健 on 2019/9/27.
//  Copyright © 2019 qwang. All rights reserved.
/*
 ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 ⚠️  所有功能只要设置任意属性为YES即可生效                ⚠️
 ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (CheckInput)

/** 若要限制不能输入符号，则将该值置为YES */
@property (nonatomic, assign) BOOL cannotInputSymbol;
/** 若用户输入的数据非限制内容，弹出的提示内容 */
@property (nonatomic, copy) NSString *inputSymbolDec;

/** 若要限制不能输入Emoji表情，则将该值置为YES */
@property (nonatomic, assign) BOOL cannotInputEmoji;
/** 若用户输入的数据非限制内容，弹出的提示内容 */
@property (nonatomic, copy) NSString *inputEmojiDec;

/** 若要限制不能输入中文，则将该值置为YES */
@property (nonatomic, assign) BOOL cannotInputChinese;
/** 若用户输入的数据非限制内容，弹出的提示内容 */
@property (nonatomic, copy) NSString *inputChineseDec;

/** 若要限制只能输入数字【包含小数点】，则将该值置为YES */
@property (nonatomic, assign) BOOL canOnlyInputNumber;
/** 若用户输入的数据非限制内容，弹出的提示内容 */
@property (nonatomic, copy) NSString *inputNumberDec;

/** 若要限制只能输入字母数字下划线中横杠，则将该值置为YES */
@property (nonatomic, assign) BOOL canOnlyInputOrderNumber;
/** 若用户输入的数据非限制内容，弹出的提示内容 */
@property (nonatomic, copy) NSString *inputOrderNumberDec;

@end

NS_ASSUME_NONNULL_END

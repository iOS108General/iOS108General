//
//  UIView+CheckInput.h
//  DouShanSwift
//
//  Created by 东健 on 2019/12/6.
//  Copyright © 2019 qwang. All rights reserved.
//
/*
⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
⚠️         所有功能只要设置任意属性为YES即可生效         ⚠️
⚠️ 若同时启用多项功能，则内容按照这里的属性顺序依次处理     ⚠️
⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
*/
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CheckInput)

// MARK: -
// MARK: 输入检测所必须属性，在非 UITextField 或 UITextView 上设置无效
/** 设置最大输入长度 【暂未实现】*/
@property (nonatomic, assign) NSInteger inputMaxCount;

/** 若要限制不能输入符号，则将该值置为YES */
@property (nonatomic, assign) BOOL cannotInputSymbol;
/** 若用户输入的数据非限制内容，弹出的提示内容 */
@property (nonatomic, copy) NSString *inputSymbolDec;

/** 若要限制不能输入Emoji表情，则将该值置为YES，当前永远为 YES 外界设值无效*/
@property (nonatomic, assign) BOOL cannotInputEmoji;
/** 若用户输入的数据非限制内容，弹出的提示内容 */
@property (nonatomic, copy) NSString *inputEmojiDec;

/** 若要限制不能输入中文，则将该值置为YES */
@property (nonatomic, assign) BOOL cannotInputChinese;
/** 若用户输入的数据非限制内容，弹出的提示内容 */
@property (nonatomic, copy) NSString *inputChineseDec;

/** 若要限制只能输入数字【仅包含一位小数点】，则将该值置为YES */
@property (nonatomic, assign) BOOL canOnlyInputNumber;
/** 若用户输入的数据非限制内容，弹出的提示内容 */
@property (nonatomic, copy) NSString *inputNumberDec;

/** 若要限制只能输入字母数字下划线中横杠，则将该值置为YES */
@property (nonatomic, assign) BOOL canOnlyInputOrderNumber;
/** 若用户输入的数据非限制内容，弹出的提示内容 */
@property (nonatomic, copy) NSString *inputOrderNumberDec;

/** 自定义 CharacterSet 过滤规则，当此属性值长度不为0则立即生效 */
@property (nonatomic, assign) NSString *customRules;
/** 若用户输入的数据非自定义规则限制内容，弹出的提示内容 */
@property (nonatomic, copy) NSString *customRulesDec;

@end

NS_ASSUME_NONNULL_END

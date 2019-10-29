//
//  UIApplication+CheckInput.h
//  DouShanSwift
//
//  Created by 东健 on 2019/10/7.
//  Copyright © 2019 qwang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (CheckInput)

// MARK: -
// MARK: UITextView 输入检测
- (void)textViewInputChange:(NSNotification *)noti;

// MARK: -
// MARK: UITextField 输入检测
- (void)textFieldInputChange:(NSNotification *)noti;

@end

NS_ASSUME_NONNULL_END

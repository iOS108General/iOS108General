//
//  InputViewController.m
//  iOS108General
//
//  Created by 东健 on 2019/10/29.
//  Copyright © 2019 iOS108. All rights reserved.
//

#import "InputViewController.h"
#import "UITextView+CheckInput.h"
#import "UITextField+CheckInput.h"

@interface InputViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstInput;
@property (weak, nonatomic) IBOutlet UITextField *seconedInput;
@property (weak, nonatomic) IBOutlet UITextField *thirdInput;
@property (weak, nonatomic) IBOutlet UITextView *inputTextV;
@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     实现初衷：文字输入检测如果在每个页面都实现一套正则太过麻烦并且不易于维护
     实现后的效果：会自动去除非法字符，若设置了相关的 Dec 字段，会弹出相应的文字提示
     可自行实现 UIApplication+CheckInput 文件中 inputUnlawfulnessShowMessageToWindow 方法自定义提示效果
     当同时设置多个属性为YES的时候，会根据 UITextField+CheckInput 属性顺序依次进行检测过滤，若违反多个规则，则提示信息为多个规则相应描述拼接后的结果
     */
    
    // 只能输入数字
    self.firstInput.canOnlyInputNumber = YES;
    self.firstInput.inputNumberDec = @"这个输入框只能输入数字";
    
    // 不能输入汉字
    self.seconedInput.cannotInputChinese = YES;
    self.seconedInput.inputChineseDec = @"这个输入框不能输入汉字";
    self.seconedInput.cannotInputSymbol = YES;
    self.seconedInput.inputSymbolDec = @"这个输入框不能输入符号";
    
    
    // 只能输入订单号【数字，字母，下划线，中横杠】
    self.thirdInput.canOnlyInputOrderNumber = YES;
    self.seconedInput.inputOrderNumberDec = @"这个输入框只能输入 数字，字母，下划线，中横杠";
    // 只能输入数字
    self.inputTextV.canOnlyInputNumber = YES;
    self.inputTextV.inputNumberDec = @"这个输入框只能输入数字";
}
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end

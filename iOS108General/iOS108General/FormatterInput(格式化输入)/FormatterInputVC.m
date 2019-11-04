//
//  FormatterInputVC.m
//  iOS108General
//
//  Created by 东健 on 2019/11/4.
//  Copyright © 2019 iOS108. All rights reserved.
//

#import "FormatterInputVC.h"
#import "UITextField+Format.h"

@interface FormatterInputVC () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputTextF;

@end

@implementation FormatterInputVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     实现初衷：对用户输入的数据，例如电话号或者身份证号进行格式化显示，优化显示效果
     实现后的效果：可自定义在某几个位置对输入数据进行空格分割，也可固定长度插入空格，已考虑到 UIMenuController的操作
     目前的限制：只支持数字或字母等单个字符的输入，拼音输入汉字时无法输入
     */
    
    self.inputTextF.delegate = self;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // 在 4 9 14 19 24 字符位置插入空格
//    return [textField textFieldShouldChangeCharactersInRange:range replacementString:string blankLocations:@[@4,@9,@14,@19,@24] limitCount:0];
    
    // 每 6 位插入一个空格
    return [textField textFieldShouldChangeCharactersInRange:range replacementString:string location:6 limitCount:0];
}


@end

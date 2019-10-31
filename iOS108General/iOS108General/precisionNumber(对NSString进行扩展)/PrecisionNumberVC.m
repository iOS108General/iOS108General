//
//  PrecisionNumberVC.m
//  iOS108General
//
//  Created by 东健 on 2019/10/29.
//  Copyright © 2019 iOS108. All rights reserved.
//

#import "PrecisionNumberVC.h"
#import "NSString+DecimalNumber.h"

@interface PrecisionNumberVC ()

@end

@implementation PrecisionNumberVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 对字符串进行保留 3 位小数 ，采用 四舍五入 的保留规则
    NSString *floatStr = [@"我是5.65.5325" floatValueWithScale:3 type:NSRoundPlain];
    NSLog(@"%@",floatStr);
    
    NSString *first = @"5.233";
    NSString *seconed = @"5.24";
    // 在保留两位小数并且采用四舍五入的计算规则计算差值
    double subtracting = [first subtractingWithString:seconed scale:2 type:NSRoundPlain];
    if (subtracting > 0) {
        NSLog(@"后者值比较小");
    }
    
    if (subtracting < 0) {
        NSLog(@"后者值比较大");
    }
    
    if (subtracting == 0) {
        NSLog(@"后者与前者相等");
    }
    
    // 直接计算绝对差值
    double absoluteValue = [@"5.2399999999999999999999999999999999999999" subtractingWithString:@"5.24"];
    if (absoluteValue > 0) {
        NSLog(@"后者值比较小");
    }
    
    if (absoluteValue < 0) {
        NSLog(@"后者值比较大");
    }
    
    if (absoluteValue == 0) {
        NSLog(@"后者与前者相等");
    }
    
    // 直接计算绝对差值
    double addValue = [@"5.2" addingWithString:@"5.24" scale:1 type:NSRoundPlain];
    NSLog(@"%f",addValue);
}

- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

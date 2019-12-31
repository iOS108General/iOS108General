//
//  ShadowCornerViewController.m
//  iOS108General
//
//  Created by 李志强 on 2019/12/31.
//  Copyright © 2019 iOS108. All rights reserved.
//

#import "ShadowCornerViewController.h"
#import "ShadowCornerView.h"
#import <Masonry/Masonry.h>
@interface ShadowCornerViewController ()

@end

@implementation ShadowCornerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self viewInit];
    // Do any additional setup after loading the view.
}

- (void)viewInit
{
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel * lb = [[UILabel alloc] init];
    lb.text = @"slkdjfaksjdf";
    lb.textAlignment = NSTextAlignmentCenter;
    lb.shadowCorner = ShadowAll|CornerTopLeft|CornerBottomRight|CornerType8;
    lb.backgroundColor = [UIColor redColor];
    lb.translatesAutoresizingMaskIntoConstraints = NO;

    UIView * cornerView = [ShadowCornerView viewWithContentView:lb];
    [self.view addSubview:cornerView];

    [cornerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@(150));
        make.height.equalTo(@(40));
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

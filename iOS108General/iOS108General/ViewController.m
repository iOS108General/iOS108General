//
//  ViewController.m
//  iOS108General
//
//  Created by 东健 on 2019/10/29.
//  Copyright © 2019 iOS108. All rights reserved.
//

#import "ViewController.h"

static NSString *const funcTitle = @"funcTitle";
static NSString *const funcDec = @"funcDec";
static NSString *const funcVC = @"funcVC";

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"iOS108General 功能列表";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:0];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.dataArray = @[
                       @{
                           funcTitle : @"InputHelper(文字输入检测)",
                           funcDec : @"利用分类去统一输入框的输入检测，利于维护",
                           funcVC : @"InputViewController"
                         },
                       @{
                         funcTitle : @"precisionNumber(对NSString进行扩展)",
                         funcDec : @"对NSString进行扩展,实现字符串转Float精度保留以及字符串直接比较大小等",
                         funcVC : @"PrecisionNumberVC"
                       },
                       @{
                           funcTitle : @"FormatterInput(格式化输入)",
                           funcDec : @"对输入框内文字输入进行指定任意几个位置插入空格，或者",
                           funcVC : @"FormatterInputVC"
                           },
                       ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (listCell == nil) {
        listCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    NSDictionary *data = self.dataArray[indexPath.row];
    listCell.textLabel.text = data[funcTitle];
    listCell.detailTextLabel.text = data[funcDec];
    listCell.detailTextLabel.numberOfLines = 0;
    return listCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *data = self.dataArray[indexPath.row];
    UIViewController *vc = [NSClassFromString(data[funcVC]) new];
    if (vc) {
        [self presentViewController:vc animated:YES completion:nil];
    }
}

@end

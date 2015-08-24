

//
//  LeftViewController.m
//  SidesLip_Demo
//
//  Created by 沈红榜 on 15/8/24.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation LeftViewController {
    UITableView     *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _width = _width ?: CGRectGetWidth(self.view.frame);
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _width, CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 50;
    [self.view addSubview:_tableView];
    _tableView.bounces = false;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = (NSString *)_titles[indexPath.row];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_clickedNum) {
        _clickedNum(indexPath.row);
    }
}

@end

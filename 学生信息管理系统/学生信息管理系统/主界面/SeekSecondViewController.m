//
//  SeekSecondViewController.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/8/2.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "SeekSecondViewController.h"
#import "SeekSecondTableViewCell.h"

@interface SeekSecondViewController ()

@end

@implementation SeekSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *backgroundImage = [UIImage imageNamed:@"image-2.jpg"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 550) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[SeekSecondTableViewCell class] forCellReuseIdentifier:@"111"];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame = CGRectMake(90, 500, 200, 50);
    [self.view addSubview:back];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont systemFontOfSize:25];
    back.tintColor = [UIColor whiteColor];
    back.backgroundColor = [UIColor clearColor];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    
    
}

- (void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SeekSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    
    cell.nameLabel.text = _nameArr[indexPath.row];
    cell.scoreLabel.text = _scoreArr[indexPath.row];
    cell.classLabel.text = _classArr[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
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

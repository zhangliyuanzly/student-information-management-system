//
//  MainViewController.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "SeekViewController.h"
#import "ModifyViewController.h"
#import "Account.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *backgroundImage = [UIImage imageNamed:@"image-2.jpg"];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"展示";
    //backGroundImage什么意思,改变透明度
    self.view.layer.contents = (id) backgroundImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, 500, 400) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"111"];
    
    
    //添加按钮
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 400, 80, 40)];
    addButton.tag = 101;
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:15];
    addButton.layer.masksToBounds = YES;
    addButton.layer.cornerRadius = 5;
    addButton.backgroundColor = [UIColor whiteColor];
    [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    //删除按钮
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 400, 80, 40)];
    deleteButton.tag = 102;
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:15];
    deleteButton.layer.masksToBounds = YES;
    deleteButton.layer.cornerRadius = 5;
    deleteButton.backgroundColor = [UIColor whiteColor];
    [deleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteButton];
    
    //修改按钮
    UIButton *modifyButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 470, 80, 40)];
    modifyButton.tag = 103;
    [modifyButton setTitle:@"修改" forState:UIControlStateNormal];
    modifyButton.titleLabel.font = [UIFont systemFontOfSize:15];
    modifyButton.layer.masksToBounds = YES;
    modifyButton.layer.cornerRadius = 5;
    modifyButton.backgroundColor = [UIColor whiteColor];
    [modifyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [modifyButton addTarget:self action:@selector(modify) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:modifyButton];
    
    //查找按钮
    UIButton *seekButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 470, 80, 40)];
    seekButton.tag = 104;
    [seekButton setTitle:@"查找" forState:UIControlStateNormal];
    seekButton.titleLabel.font = [UIFont systemFontOfSize:15];
    seekButton.layer.masksToBounds = YES;
    seekButton.layer.cornerRadius = 5;
    seekButton.backgroundColor = [UIColor whiteColor];
    [seekButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [seekButton addTarget:self action:@selector(seek) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:seekButton];
    
    //退出按钮
    UIButton *returnButton = [[UIButton alloc] initWithFrame:CGRectMake(140, 540, 80, 40)];
    returnButton.tag = 104;
    [returnButton setTitle:@"退出" forState:UIControlStateNormal];
    returnButton.titleLabel.font = [UIFont systemFontOfSize:15];
    returnButton.layer.masksToBounds = YES;
    returnButton.layer.cornerRadius = 5;
    returnButton.backgroundColor = [UIColor whiteColor];
    [returnButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(return) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnButton];

    
    _nameArray = [[NSMutableArray alloc] init];
    [_nameArray addObject:@"师爷"];
    [_nameArray addObject:@"黄四郎"];
    [_nameArray addObject:@"王麻子"];
    [_nameArray addObject:@"马县长"];
    
    _classArray = [[NSMutableArray alloc] init];
    [_classArray addObject:@"计科一班"];
    [_classArray addObject:@"计科一班"];
    [_classArray addObject:@"计科一班"];
    [_classArray addObject:@"计科一班"];
    
    _scoreArray = [[NSMutableArray alloc] init];
    [_scoreArray addObject:@"87"];
    [_scoreArray addObject:@"64"];
    [_scoreArray addObject:@"17"];
    [_scoreArray addObject:@"98"];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    [cell give:indexPath Arr1:_nameArray Arr2:_scoreArray Arr3:_classArray];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (void)add {
    AddViewController *addController = [[AddViewController alloc] init];
    //呈现全屏
    addController.modalPresentationStyle = UIModalPresentationFullScreen;
    //把main里面的数组给到add函数中的数组
    addController.nameArr = _nameArray;
    addController.classArr = _classArray;
    addController.scoreArr = _scoreArray;
    addController.addDelegate = self;
    [self presentViewController:addController animated:NO completion:nil];
    
}

- (void)delete {
    DeleteViewController *deleteController = [[DeleteViewController alloc] init];
    deleteController.modalPresentationStyle = UIModalPresentationFullScreen;
    deleteController.nameArr = _nameArray;
    deleteController.scoreArr = _scoreArray;
    deleteController.classArr = _classArray;
    deleteController.deleteDelegate = self;
    [self presentViewController:deleteController animated:NO completion:nil];
}

- (void)modify{
    ModifyViewController *modifyController = [[ModifyViewController alloc] init];
    //全屏
    modifyController.modalPresentationStyle = UIModalPresentationFullScreen;
    modifyController.nameArr = _nameArray;
    modifyController.scoreArr = _scoreArray;
    modifyController.classArr = _classArray;
    modifyController.modifyDelegate = self;
    [self presentViewController:modifyController animated:NO completion:nil];
    
}

- (void)seek{
    SeekViewController *seekController = [[SeekViewController alloc] init];
    seekController.modalPresentationStyle = UIModalPresentationFullScreen;
    seekController.nameArr = _nameArray;
    seekController.scoreArr = _scoreArray;
    seekController.classArr = _classArray;
    [self presentViewController:seekController animated:NO completion:nil];
}

-(void) return{
    exit(0);
}

- (void)pass:(Account *)account {
    [_nameArray addObject:account.nameString];
    [_scoreArray addObject:account.scoreString];
    [_classArray addObject:account.classString];
    [_tableView reloadData];
}




- (void)deletepass1:(NSMutableArray *)nameArr pass2:(NSMutableArray *)scoreArr pass3:(NSMutableArray *)classArr{
    
    _nameArray = nameArr;
    _scoreArray = scoreArr;
    _classArray = classArr;
    [_tableView reloadData];
    
}

-(void)modifypass1:(NSMutableArray *)nameArr pass2:(NSMutableArray *)scoreArr pass3:(NSMutableArray *)classArr{
    _nameArray = nameArr;
    _scoreArray = scoreArr;
    _classArray = classArr;
    [_tableView reloadData];
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

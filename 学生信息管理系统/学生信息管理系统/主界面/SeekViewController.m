//
//  SeekViewController.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "SeekViewController.h"
#import "SeekSecondViewController.h"
#import "MainTableViewCell.h"

@interface SeekViewController ()

@end

@implementation SeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *backgroundImage = [UIImage imageNamed:@"image-2.jpg"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    self.view.layer.contents = (id) backgroundImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 300, 300, 50)];
    _nameTextField.layer.masksToBounds = YES;
    _nameTextField.backgroundColor = [UIColor whiteColor];
    _nameTextField.layer.cornerRadius = 5;
    _nameTextField.placeholder = @"请输入要查找的姓名";
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_nameTextField];
    
    UIButton *seekButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 550, 80, 40)];
    [seekButton setTitle:@"查找" forState:UIControlStateNormal];
    seekButton.titleLabel.font = [UIFont systemFontOfSize:15];
    seekButton.layer.masksToBounds = YES;
    seekButton.layer.cornerRadius = 5;
    seekButton.backgroundColor = [UIColor whiteColor];
    [seekButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [seekButton addTarget:self action:@selector(seek) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:seekButton];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:backButton];
    backButton.frame = CGRectMake(200, 550, 80, 40);
    backButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.backgroundColor = [UIColor whiteColor];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 500, 200) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"111"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillClose:) name:UIKeyboardWillHideNotification object:nil];
    
    
}

-(void) keyboardWillShow:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:0.8 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);}];
    
}

-(void) keyboardWillClose:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:0.8 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height - keyboardY);}];
}


-(void)seek{
    int count = 0;
    _name2Arr = [[NSMutableArray alloc] init];
    _score2Arr = [[NSMutableArray alloc] init];
    _class2Arr = [[NSMutableArray alloc] init];
    if (_nameTextField.text.length == 0) {
        UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入人名" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert1 addAction:action1];
        [self presentViewController:alert1 animated:NO completion:nil];
    }else if(_nameTextField.text.length != 0){
        for (int i = 0; i < _nameArr.count; i++) {
            if ([_nameTextField.text isEqualToString:_nameArr[i]]) {
                [_name2Arr addObject:_nameArr[i]];
                [_score2Arr addObject:_scoreArr[i]];
                [_class2Arr addObject:_classArr[i]];
                count++;
            }
            
        }
        if (count == 0) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"未找到此人，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:action2];
            [self presentViewController:alertController animated:NO completion:nil];
        }
        SeekSecondViewController *seekSecondVC = [[SeekSecondViewController alloc] init];
        seekSecondVC.nameArr = _name2Arr;
        seekSecondVC.scoreArr = _score2Arr;
        seekSecondVC.classArr = _class2Arr;
        [self presentViewController:seekSecondVC animated:NO completion:nil];
    }
}

- (void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_nameTextField endEditing:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    [cell give:indexPath Arr1:_nameArr Arr2:_scoreArr Arr3:_classArr];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
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

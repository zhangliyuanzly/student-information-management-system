//
//  AddViewController.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "AddViewController.h"
#import "MainTableViewCell.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.title = @"增加";
    //self.view.backgroundColor = [UIColor clearColor];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"image-2.jpg"];

    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    //左上角返回按钮
    /*
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    */
     
    //backGroundImage什么意思,改变透明度

    self.view.layer.contents = (id) backgroundImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 300, 300, 50)];
    _nameTextField.layer.masksToBounds = YES;
    _nameTextField.backgroundColor = [UIColor whiteColor];
    _nameTextField.layer.cornerRadius = 5;
    _nameTextField.placeholder = @"请输入要添加的姓名";
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_nameTextField];
    
    _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 380, 300, 50)];
    _classTextField.layer.masksToBounds = YES;
    _classTextField.backgroundColor = [UIColor whiteColor];
    _classTextField.layer.cornerRadius = 5;
    _classTextField.placeholder = @"请输入班级";
    _classTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_classTextField];
    
    _scoreTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 460, 300, 50)];
    _scoreTextField.layer.masksToBounds = YES;
    _scoreTextField.layer.cornerRadius = 5;
    _scoreTextField.backgroundColor = [UIColor whiteColor];
    _scoreTextField.placeholder = @"请输入成绩";
    _scoreTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_scoreTextField];
    
    //添加按钮
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 550, 80, 40)];
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:15];
    addButton.layer.masksToBounds = YES;
    addButton.layer.cornerRadius = 5;
    [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置按钮的背景颜色
    [addButton setBackgroundColor:[UIColor whiteColor]];

    [addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:backButton];
    backButton.frame = CGRectMake(200, 550, 80, 40);
    backButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.backgroundColor = [UIColor whiteColor];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 500, 300) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];

    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"111"];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillClose:) name:UIKeyboardWillHideNotification object:nil];
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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

-(void)add{
    if (_nameTextField.text.length == 0 || _classTextField.text.length == 0 || _scoreTextField.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:alertAction];
        [self presentViewController:alert animated:NO completion:nil];
    }else{
        [self dismissViewControllerAnimated:NO completion:nil];
        if ([_addDelegate respondsToSelector:@selector(pass:)]) {
            Account *account = [[Account alloc] init];
            account.nameString = _nameTextField.text;
            account.classString = _classTextField.text;
            account.scoreString = _scoreTextField.text;
            [_addDelegate pass:account];
             
        }
    }
}

//add里面还需要加一个返回按钮

- (void)back {
    [self dismissViewControllerAnimated:NO completion:nil];
}

//关闭键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_nameTextField endEditing:YES];
    [_scoreTextField endEditing:YES];
    [_classTextField endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if(textField == _nameTextField) {
        [_scoreTextField becomeFirstResponder];
    }
    if(textField == _scoreTextField){
        [_classTextField becomeFirstResponder];
    }
    if(textField == _classTextField){
        [textField resignFirstResponder];
    }
    
    return YES;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

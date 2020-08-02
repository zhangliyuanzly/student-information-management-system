//
//  RegisterViewController.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/28.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建数组
    _accountandpassCombination = [[NSMutableArray alloc] init];
    
    UIImage *backgroundPhoto = [UIImage imageNamed:@"image-1.jpg"];
    self.view.layer.contents = (id) backgroundPhoto.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    
    _accountTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 250, 300, 40)];
    _accountTextField.backgroundColor = [UIColor whiteColor];
    _accountTextField.placeholder = @"请输入账号:";
    //圆角风格
    _accountTextField.borderStyle = UITextBorderStyleRoundedRect;
    _accountTextField.delegate = self;
    //_accountTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_accountTextField];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 320, 300, 40)];
    _passwordTextField.backgroundColor = [UIColor whiteColor];
    _passwordTextField.placeholder = @"请输入密码:";
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    //不显示密码
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.delegate = self;
    [self.view addSubview:_passwordTextField];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 400, 100, 40)];
    //裁剪视图
    registerButton.layer.masksToBounds = YES;
    registerButton.layer.cornerRadius = 5;
    registerButton.backgroundColor = [UIColor whiteColor];
    [registerButton setTitle:@"确定注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(returnAccount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillClose:) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void) keyboardWillShow:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:0.8 animations:^{self.view
        .transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);}];
}

-(void) keyboardWillClose:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:0.8 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height - keyboardY);}];
}

//点击回收键盘
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


-(void) returnAccount{
    [self.view endEditing:YES];
    if(_accountTextField.text.length == 0 || _passwordTextField.text.length == 0){
        UIAlertController *blankAlertController = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"请输入账号和密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *returnAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
        [blankAlertController addAction:returnAction];
        [self presentViewController:blankAlertController animated:YES completion:nil];
        return;
    }
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    [tempArray addObject:_accountTextField.text];
    [tempArray addObject:_passwordTextField.text];
    [_accountandpassCombination addObject:tempArray];
    [self dismissViewControllerAnimated:YES completion:nil];
    //这一句是帮别人传值
    if([_registerDelegate respondsToSelector:@selector(passAccount:passPassword:)]){
        [_registerDelegate passAccount:_accountTextField.text passPassword:_passwordTextField.text];
    }
    
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

//
//  AccountViewController.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/28.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "AccountViewController.h"
#import "RegisterViewController.h"
#import "MainViewController.h"

@interface AccountViewController ()<UITextFieldDelegate, RegisterViewControllerDelegate>

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置账号和密码
    _accountandpassCombination = [[NSMutableArray alloc] init];
    [_accountandpassCombination addObjectsFromArray:@[@[@"Q", @"q"], @[@"Qqq", @"111"],]];
    
    //选择背景图片
    UIImage *backgroundPhoto = [UIImage imageNamed:@"image-3.jpg"];
    self.view.layer.contents = (id) backgroundPhoto.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //加载搜索框
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
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.delegate = self;
    [self.view addSubview:_passwordTextField];
    
    //登陆和注册按钮
    UIButton *accountButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 450, 100, 40)];
    //裁剪超出视图部分
    accountButton.layer.masksToBounds = YES;
    //设置圆角效果程度
    accountButton.layer.cornerRadius = 5;
    accountButton.backgroundColor = [UIColor whiteColor];

    [accountButton setTitle:@"登陆" forState:UIControlStateNormal];
    [accountButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [accountButton addTarget:self action:@selector(touchAccout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:accountButton];
    
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 450, 100, 40)];
    registerButton.layer.cornerRadius = 5;
    registerButton.backgroundColor = [UIColor whiteColor];
    
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [registerButton addTarget:self action:@selector(touchRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    //设置代理方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillClose:) name:UIKeyboardWillHideNotification object:nil];

}

-(void) keyboardWillShow:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //键盘调用时调节界面高度
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:0.8 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);}];
    
}

-(void) keyboardWillClose:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:0.8 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height - keyboardY);}];
}

//文本字段委托方法
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

//再次点击空白处回收键盘
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void) passAccount:(NSString *) accountString passPassword:(NSString *)passwordString{
    //把函数接收到的参数传到原来的text上
    _accountTextField.text = accountString;
    _passwordTextField.text = passwordString;
    //新建一个可变数组，将原本的参数加到这个可变数组中
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    [tempArray addObject:accountString];
    [tempArray addObject:passwordString];
    //最后将可变数组加到总的可变数组中
    [_accountandpassCombination addObject:tempArray];
}

//进入主页面
-(void) touchAccout{
    [self.view endEditing:YES];
    for (int i = 0; i < _accountandpassCombination.count; i++) {
            if ([_accountTextField.text isEqualToString:_accountandpassCombination[i][0]] && [_passwordTextField.text isEqualToString:_accountandpassCombination[i][1]] ) {
            //进入主界面
            MainViewController *mainViewController = [[MainViewController alloc] init];
            //全屏
            mainViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:mainViewController animated:YES completion:nil];
        }
    }
    //错误弹窗
    UIAlertController *wrongPopupWindow = [UIAlertController alertControllerWithTitle:@"登陆失败" message:@"账号或密码错误" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *returnPopupWindow = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
    [wrongPopupWindow addAction:returnPopupWindow];
    [self presentViewController:wrongPopupWindow animated:YES completion:nil];
    
}

-(void) touchRegister{
    [self.view endEditing:YES];
    
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    registerViewController.registerDelegate = self;
    registerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerViewController animated:YES completion:nil];
    registerViewController.accountandpassCombination = _accountandpassCombination;

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

//
//  ModifySecondViewController.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/31.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "ModifySecondViewController.h"

@interface ModifySecondViewController ()

@end

@implementation ModifySecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backgroundImage = [UIImage imageNamed:@"image-2.jpg"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    backgroundImageView.frame = self.view.bounds;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 300, 50)];
    _nameTextField.layer.masksToBounds = YES;
    _nameTextField.backgroundColor = [UIColor clearColor];
    _nameTextField.layer.cornerRadius = 5;
    _nameTextField.placeholder = @"请输入要修改的姓名";
    _nameTextField.text = _str;
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_nameTextField];
    
    _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 130, 300, 50)];
    _classTextField.layer.masksToBounds = YES;
    _classTextField.backgroundColor = [UIColor clearColor];
    _classTextField.layer.cornerRadius = 5;
    _classTextField.placeholder = @"请输入班级";
    _classTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_classTextField];
    
    _scoreTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 210, 300, 50)];
    _scoreTextField.layer.masksToBounds = YES;
    _scoreTextField.layer.cornerRadius = 5;
    _scoreTextField.backgroundColor = [UIColor clearColor];
    _scoreTextField.placeholder = @"请输入成绩";
    _scoreTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_scoreTextField];
    
    UIButton *modifyButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 550, 80, 40)];
    [modifyButton setTitle:@"修改" forState:UIControlStateNormal];
    modifyButton.titleLabel.font = [UIFont systemFontOfSize:15];
    modifyButton.layer.masksToBounds = YES;
    modifyButton.layer.cornerRadius = 5;
    modifyButton.backgroundColor = [UIColor whiteColor];
    [modifyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[modifyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置按钮的背景颜色
    //[modifyButton setBackgroundColor:[UIColor clearColor]];
    //modifyButton.layer.borderWidth = 2;
    //modifyButton.layer.borderColor = [UIColor redColor].CGColor;
    [modifyButton addTarget:self action:@selector(modify) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:modifyButton];
    
    
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

//关闭键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_nameTextField endEditing:YES];
    [_scoreTextField endEditing:YES];
    [_classTextField endEditing:YES];
}


- (void)modify{
    int i;
    for(i = 0; i < _nameArr.count; i++){
        if([_nameArr[i] isEqualToString:_str]){
            [_nameArr replaceObjectAtIndex:i withObject:_nameTextField.text];
            [_scoreArr replaceObjectAtIndex:i withObject:_scoreTextField.text];
            [_classArr replaceObjectAtIndex:i withObject:_classTextField.text];
        }
    }
    if([_modifySecondDelegate respondsToSelector:@selector(modifySecondPass1:Pass2:Pass3:)]){
        [_modifySecondDelegate modifySecondPass1:_nameArr Pass2:_scoreArr Pass3:_classArr];
    }
    [self dismissViewControllerAnimated:NO completion:nil];
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

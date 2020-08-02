//
//  ModifyViewController.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "ModifyViewController.h"
#import "ModifySecondViewController.h"
#import "MainTableViewCell.h"


@interface ModifyViewController ()

@end

@implementation ModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *backgroundImage = [UIImage imageNamed:@"image-2.jpg"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    backgroundImageView.frame = self.view.bounds;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 400, 250, 50)];
    _nameTextField.backgroundColor = [UIColor whiteColor];
    _nameTextField.placeholder = @"请输入要修改的姓名";
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _nameTextField.secureTextEntry = NO;
    [self.view addSubview:_nameTextField];
    
    UIButton *modifyButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 550, 80, 40)];
    [modifyButton setTitle:@"修改" forState:UIControlStateNormal];
    modifyButton.titleLabel.font = [UIFont systemFontOfSize:15];
    modifyButton.layer.masksToBounds = YES;
    modifyButton.layer.cornerRadius = 5;
    modifyButton.backgroundColor = [UIColor whiteColor];
    [modifyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [modifyButton addTarget:self action:@selector(modify) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:modifyButton];
    
    //返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:backButton];
    backButton.frame = CGRectMake(200, 550, 80, 40);
    backButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.backgroundColor = [UIColor whiteColor];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 500, 300)];
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
    //键盘调用时调节界面高度
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:0.8 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);}];
    
}

-(void) keyboardWillClose:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:0.8 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height - keyboardY);}];
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

-(void)modify{
    int i;
    for (i = 0; i < _nameArr.count; i++) {
        if ([_nameArr[i] isEqualToString:_nameTextField.text]) {
            break;
        }
    }
    if (i != _nameArr.count ) {
       /*
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否进行修改" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action){

        }];
*/

       // UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
                  // [alertController addAction:sureAction];
                   //[alertController addAction:cancel];
                   //[self presentViewController:alertController animated:NO completion:nil];
                   //break;
        /*
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:sureAction];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:NO completion:nil];
         */
        
        ModifySecondViewController *secondVC = [[ModifySecondViewController alloc] init];
        secondVC.modalPresentationStyle = UIModalPresentationFullScreen;
        secondVC.nameArr = self->_nameArr;
        secondVC.scoreArr = self->_scoreArr;
        secondVC.classArr = self->_classArr;
        secondVC.str = self->_nameTextField.text;
        secondVC.modifySecondDelegate = self;
        [self presentViewController:secondVC animated:NO completion:nil];
        }
    if (i == _nameArr.count) {
        UIAlertController *alert1Controller = [UIAlertController alertControllerWithTitle:@"提示" message:@"未找到，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure1Action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert1Controller addAction:sure1Action];
        [self presentViewController:alert1Controller animated:NO completion:nil];
    }

}

- (void)back{
    if([_modifyDelegate respondsToSelector:@selector(modifypass1:pass2:pass3:)]){
        [_modifyDelegate modifypass1:_nameArr pass2:_scoreArr pass3:_classArr];
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (void)modifySecondPass1:(NSMutableArray *)nameArr Pass2:(NSMutableArray *)scoreArr Pass3:(NSMutableArray *)classArr{
    _nameArr = nameArr;
    _scoreArr = scoreArr;
    _classArr = classArr;
    [_tableView reloadData];
    
}
 
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_nameTextField endEditing:YES];
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

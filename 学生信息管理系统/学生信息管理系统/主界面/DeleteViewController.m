//
//  DeleteViewController.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "DeleteViewController.h"
#import "MainTableViewCell.h"

@interface DeleteViewController (){
    int i;
}

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *backImage = [UIImage imageNamed:@"image-2.jpg"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 350, 250, 50)];
    _nameTextField.backgroundColor = [UIColor whiteColor];
    _nameTextField.placeholder = @"请输入要查找的姓名";
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _nameTextField.secureTextEntry = NO;
    [self.view addSubview:_nameTextField];
    
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 550, 80, 40)];
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:15];
    deleteButton.layer.masksToBounds = YES;
    deleteButton.layer.cornerRadius = 5;
    deleteButton.backgroundColor = [UIColor whiteColor];
    [deleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteButton];
    
    
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


-(void) delete{
    for (i = 0; i < _nameArr.count; i++) {
        if ([_nameArr[i] isEqualToString:_nameTextField.text]){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已找到此人，确认是否删除" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){[self delete2];}];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:sure];
            [alert addAction:cancel];
            [self presentViewController:alert animated:NO completion:nil];
            break;
        }
        /*
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否确定要删除" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"不了" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:alertAction];
            //[alert addAction:cancel];
            [self presentViewController:alert animated:NO completion:nil];
            [self dismissViewControllerAnimated:NO completion:nil];
            [_nameArr removeObjectAtIndex:i];
            [_scoreArr removeObjectAtIndex:i];
            [_classArr removeObjectAtIndex:i];
            [self dismissViewControllerAnimated:NO completion:nil];
            if ([_deleteDelegate respondsToSelector:@selector(deletepass1:pass2:pass3:)]) {
                [_deleteDelegate deletepass1:_nameArr pass2:_scoreArr pass3:_classArr];
            }
            break;
        
        }
         */
    }
    if(i == _nameArr.count){
        UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"警告" message:@"未查找到此人" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert1 addAction:sure1];
        [self presentViewController:alert1 animated:NO completion:nil];
    }
}


-(void)delete2{
    [_nameArr removeObjectAtIndex:i];
    [_scoreArr removeObjectAtIndex:i];
    [_classArr removeObjectAtIndex:i];
    [self dismissViewControllerAnimated:NO completion:nil];
    if ([_deleteDelegate respondsToSelector:@selector(deletepass1:pass2:pass3:)]) {
        [_deleteDelegate deletepass1:_nameArr pass2:_scoreArr pass3:_classArr];
    }
}

- (void)back{
    if([_deleteDelegate respondsToSelector:@selector(deletepass1:pass2:pass3:)]){
        [_deleteDelegate deletepass1:_nameArr pass2:_scoreArr pass3:_classArr];
    }
    [self dismissViewControllerAnimated:NO completion:nil];
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_nameTextField endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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

//
//  AccountViewController.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/28.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AccountViewController : UIViewController
<UITextFieldDelegate, RegisterViewControllerDelegate>

//账号
@property(nonatomic, strong) UITextField *accountTextField;
//密码
@property(nonatomic, strong) UITextField *passwordTextField;
//账号密码连写
@property (nonatomic, strong) NSMutableArray *accountandpassCombination;

@end

NS_ASSUME_NONNULL_END

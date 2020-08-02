//
//  RegisterViewController.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/28.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//这一段暂时不知道有什么用

@class RegisterViewController;
@protocol RegisterViewControllerDelegate<NSObject>
//函数回调参数
- (void) passAccount:(NSString *)accountString passPassword:(NSString *)passwordString;
@end

@interface RegisterViewController : UIViewController

@property (nonatomic, strong)UITextField *accountTextField;
@property (nonatomic, strong)UITextField *passwordTextField;
@property (nonatomic, strong) NSMutableArray *accountandpassCombination;

//代理协议
@property (nonatomic, weak)id <RegisterViewControllerDelegate> registerDelegate;

@end

NS_ASSUME_NONNULL_END

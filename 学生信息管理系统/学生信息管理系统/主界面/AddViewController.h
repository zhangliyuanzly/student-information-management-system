//
//  AddViewController.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"

NS_ASSUME_NONNULL_BEGIN
@class Account;
//代理
@protocol addDelegate <NSObject>

-(void) pass: (Account *) account;


@end


@interface AddViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>

@property UITextField *nameTextField;
@property UITextField *classTextField;
@property UITextField *scoreTextField;
@property (nonatomic, strong)NSMutableArray *nameArr;
@property (nonatomic, strong)NSMutableArray *scoreArr;
@property (nonatomic, strong)NSMutableArray *classArr;
@property UITableView *tableView;
@property id <addDelegate> addDelegate;


@end

NS_ASSUME_NONNULL_END

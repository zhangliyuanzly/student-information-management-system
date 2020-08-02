//
//  MainViewController.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ModifyViewController.h"
#import "Account.h"

NS_ASSUME_NONNULL_BEGIN

//引用这一个类
@class Account;
@interface MainViewController : UIViewController

<
addDelegate,
DeleteDelegate,
ModifyDelegate,
UITableViewDelegate,
UITableViewDataSource
>
 

@property UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *nameArray;
@property (nonatomic, strong)NSMutableArray *classArray;
@property (nonatomic, strong)NSMutableArray *scoreArray;
//@property(nonatomic, copy) NSMutableArray *studentInitArray;

@end

NS_ASSUME_NONNULL_END

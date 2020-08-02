//
//  ModifyViewController.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "ModifySecondViewController.h"


NS_ASSUME_NONNULL_BEGIN
@protocol ModifyDelegate <NSObject>

-(void)modifypass1:(NSMutableArray *)nameArr pass2:(NSMutableArray *)scoreArr pass3:(NSMutableArray *)classArr;

@end
@interface ModifyViewController : UIViewController
<
modifySecondDelegate,
UITableViewDelegate,
UITableViewDataSource
>

@property UITextField *nameTextField;
@property UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *nameArr;
@property (nonatomic, strong)NSMutableArray *scoreArr;
@property (nonatomic, strong)NSMutableArray *classArr;

@property id <ModifyDelegate> modifyDelegate;


@end

NS_ASSUME_NONNULL_END

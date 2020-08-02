//
//  SeekViewController.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SeekViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>

@property UITableView *tableView;
@property UITextField *nameTextField;
@property UITextField *classTextField;
@property UITextField *scoreTextField;
@property (nonatomic, strong)NSMutableArray *nameArr;
@property (nonatomic, strong)NSMutableArray *scoreArr;
@property (nonatomic, strong)NSMutableArray *classArr;
@property (nonatomic, strong)NSMutableArray *name2Arr;
@property (nonatomic, strong)NSMutableArray *score2Arr;
@property (nonatomic, strong)NSMutableArray *class2Arr;

@end

NS_ASSUME_NONNULL_END

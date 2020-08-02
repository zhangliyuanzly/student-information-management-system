//
//  SeekSecondViewController.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/8/2.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SeekSecondViewController : UIViewController

<
UITableViewDelegate,
UITableViewDataSource
>

@property UILabel *label1;
@property UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *nameArr;
@property (nonatomic, strong)NSMutableArray *scoreArr;
@property (nonatomic, strong)NSMutableArray *classArr;

@end

NS_ASSUME_NONNULL_END

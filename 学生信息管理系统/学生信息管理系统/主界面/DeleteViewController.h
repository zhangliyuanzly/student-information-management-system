//
//  DeleteViewController.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DeleteDelegate <NSObject>

-(void)deletepass1:(NSMutableArray *)nameArray pass2:(NSMutableArray *)scoreArray pass3:(NSMutableArray *)classArray;

@end
@interface DeleteViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong)UITextField *nameTextField;
@property (nonatomic, strong)UITableView *tableView;
@property NSMutableArray *nameArr;
@property NSMutableArray *scoreArr;
@property NSMutableArray *classArr;
@property id <DeleteDelegate> deleteDelegate;



@end

NS_ASSUME_NONNULL_END

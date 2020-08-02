//
//  FirstUITableViewCell.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstUITableViewCell : UIViewController

@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *classLabel;
@property(nonatomic, strong) UILabel *scoreLabel;

//现在还不知道这个有什么用
@property (nonatomic, strong) UITableView *tableView;

//- (void)give:(NSIndexPath *)indexPath Arr1:(NSMutableArray *)nameArr Arr2:(NSMutableArray *)ageArr Arr3:(NSMutableArray *)classArr;


@end

NS_ASSUME_NONNULL_END

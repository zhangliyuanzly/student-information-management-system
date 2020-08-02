//
//  MainTableViewCell.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/30.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *classLabel;
@property (nonatomic, strong)UILabel *scoreLabel;

- (void)give:(NSIndexPath *)indexPath Arr1:(NSMutableArray *)nameArray Arr2:(NSMutableArray *)scoreArray Arr3:(NSMutableArray *)classArray;



@end

NS_ASSUME_NONNULL_END

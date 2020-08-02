//
//  FirstTableViewCell.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstTableViewCell : UITableViewCell

@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *classLabel;
@property(nonatomic, strong) UILabel *scoreLabel;

@end

NS_ASSUME_NONNULL_END

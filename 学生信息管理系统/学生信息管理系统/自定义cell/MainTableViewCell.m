//
//  MainTableViewCell.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/30.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "MainTableViewCell.h"


@implementation MainTableViewCell

- (void)give:(NSIndexPath *)indexPath Arr1:(NSMutableArray *)nameArray Arr2:(NSMutableArray *)scoreArray Arr3:(NSMutableArray *)classArray {
    self.nameLabel.text = nameArray[indexPath.row];
    self.scoreLabel.text = scoreArray[indexPath.row];
    self.classLabel.text = classArray[indexPath.row];
    self.backgroundColor = [UIColor clearColor];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    _classLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_classLabel];
    
    _scoreLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_scoreLabel];
    
    return self;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(5, 25, 100, 20);
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.textColor = [UIColor blackColor];
    
    _classLabel.frame = CGRectMake(120, 25, 150, 20);
    _classLabel.font = [UIFont systemFontOfSize:15];
    //居中对齐
    _classLabel.textAlignment = NSTextAlignmentCenter;
    _classLabel.textColor = [UIColor blackColor];
    
    _scoreLabel.frame = CGRectMake(300, 25, 50, 20);
    _scoreLabel.font = [UIFont systemFontOfSize:15];
    _scoreLabel.textAlignment = NSTextAlignmentCenter;
    _scoreLabel.textColor = [UIColor blackColor];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end


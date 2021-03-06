//
//  SeekSecondTableViewCell.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/8/2.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "SeekSecondTableViewCell.h"

@implementation SeekSecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    _scoreLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_scoreLabel];
    
    _classLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_classLabel];
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(5, 25, 100, 20);
    _nameLabel.font = [UIFont systemFontOfSize:20];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.textColor = [UIColor whiteColor];
    
    _classLabel.frame = CGRectMake(120, 25, 150, 20);
    _classLabel.font = [UIFont systemFontOfSize:20];
    _classLabel.textAlignment = NSTextAlignmentCenter;
    _classLabel.textColor = [UIColor whiteColor];
    
    _scoreLabel.frame = CGRectMake(300, 25, 50, 20);
    _scoreLabel.font = [UIFont systemFontOfSize:20];
    _scoreLabel.textAlignment = NSTextAlignmentCenter;
    _scoreLabel.textColor = [UIColor whiteColor];
    
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

//
//  FirstTableViewCell.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/29.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        
        self.classLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_classLabel];
        
        self.scoreLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_scoreLabel];
    }
    return self;
}

//界面布局
-(void) layoutSubviews{
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(20, 10, 55, 30);
    
    _classLabel.frame = CGRectMake(95, 10, 90, 30);
    
    _scoreLabel.frame = CGRectMake(205, 10, 20, 30);
    
    
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

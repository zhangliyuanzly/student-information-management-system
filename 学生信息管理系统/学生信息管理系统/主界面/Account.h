//
//  Account.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/30.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Account : NSObject

@property (nonatomic, strong)NSString *nameString;
@property (nonatomic, strong)NSString *classString;
@property (nonatomic, strong)NSString *scoreString;

@end

NS_ASSUME_NONNULL_END

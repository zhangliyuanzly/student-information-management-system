//
//  StudentSystem.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/30.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentNSObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface StudentSystem : NSObject

@property (nonatomic, strong) NSMutableArray *studentNSM;

- (BOOL) addStudentArray:(StudentNSObject *)tempStudent;

- (void) deleteStudentArray:(int)deleteStudentID;

- (int) seekStudentInArray:(NSString *)studentID;

- (BOOL) modifyStudentArray:(StudentNSObject *)tempStudent modifyStudentCount:(int) NSMcount;


@end

NS_ASSUME_NONNULL_END

//
//  StudentSystem.m
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/30.
//  Copyright © 2020 张立远. All rights reserved.
//

#import "StudentSystem.h"

@implementation StudentSystem

- (id) init {
    if (self = [super init]) {
        _studentNSM = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL) addStudentArray:(StudentNSObject *)tempStudent{
    NSString *stringGrade = [NSString stringWithFormat:@"%d", tempStudent.grade];
    NSString *stringAge = [NSString stringWithFormat:@"%d", tempStudent.age];
    NSString *stringScore = [NSString stringWithFormat:@"%f", tempStudent.score];
    //NSLog(@"%@$$%@$$%@$$%@$$%@", tempStudent.nameString, tempStudent.ID, stringGrade, stringAge, stringScore);
    for (StudentNSObject *tempSystemStudent in _studentNSM) {
        if ([tempSystemStudent.ID isEqualToString:tempStudent.ID]) {
        
            return NO;
        }
    }
    if (tempStudent.nameString.length == 0 || tempStudent.ID.length == 0 || stringGrade.length == 0 || stringAge.length == 0 || stringScore.length == 0) {
        return NO;
    }
    else {
        [_studentNSM addObject:tempStudent];
        return YES;
    }
}

- (BOOL) modifierStudentArray:(StudentNSObject *)tempStudent modifierStudentCount:(int) NSMcount {
    NSString *stringGrade = [NSString stringWithFormat:@"%d", tempStudent.grade];
    NSString *stringAge = [NSString stringWithFormat:@"%d", tempStudent.age];
    NSString *stringScore = [NSString stringWithFormat:@"%f", tempStudent.score];
    if (tempStudent.nameString.length == 0 || tempStudent.ID.length == 0 || stringGrade.length == 0 || stringAge.length == 0 || stringScore.length == 0) {
        return NO;
    }
    else {
        [_studentNSM replaceObjectAtIndex:NSMcount withObject:tempStudent];
        return YES;
    }
}

- (void) deleteStudentArray:(int)deleteStudentID {
    [_studentNSM removeObject:_studentNSM[deleteStudentID]];
}

- (int) seekStudentInArray:(NSString *)studentID {
    for (int i = 0; i < _studentNSM.count; i++) {
        StudentNSObject *tempStudent = _studentNSM[i];
        if ([tempStudent.ID isEqualToString:studentID]) {
            return i;
        }
    }
    return -1;
}

@end

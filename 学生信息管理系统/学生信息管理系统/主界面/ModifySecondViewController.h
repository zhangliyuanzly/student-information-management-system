//
//  ModifySecondViewController.h
//  学生信息管理系统
//
//  Created by 张立远 on 2020/7/31.
//  Copyright © 2020 张立远. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol  modifySecondDelegate <NSObject>

- (void)modifySecondPass1:(NSMutableArray *)nameArr Pass2:(NSMutableArray *)ageArr Pass3:(NSMutableArray *)classArr;


@end

@interface ModifySecondViewController : UIViewController
<
UITextFieldDelegate
>

@property UITextField *nameTextField;
@property UITextField *classTextField;
@property UITextField *scoreTextField;
@property (nonatomic, strong)NSMutableArray *nameArr;
@property (nonatomic, strong)NSMutableArray *scoreArr;
@property (nonatomic, strong)NSMutableArray *classArr;
@property NSString *str;
@property id <modifySecondDelegate> modifySecondDelegate;


@end

NS_ASSUME_NONNULL_END

//
//  ViewController.m
//  CoreArchive
//
//  Created by muxi on 15/3/6.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"
#import "CoreArchive+Version.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    UserModel *userModel = [[UserModel alloc] init];
    
    userModel.name = @"冯成林";
    
    userModel.age = 27;
    
    BOOL res = [UserModel saveSingleModel:userModel forKey:@"charlin"];
    
    if(res){
        NSLog(@"保存成功");
    }else{
        NSLog(@"保存失败");
    }
    
//    //删除本地归档
//    [UserModel save:nil];
    
    //保存一个数组
    BOOL res2 = [UserModel saveListModel:@[userModel] forKey:nil];

}






-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //读取单个
    UserModel *userModel =[UserModel readSingleModelForKey:@"charlin"];
    
    NSLog(@"单个：%@-%@",userModel.name,@(userModel.age));
    
    
    //读取数组
    NSArray *listModel = [UserModel readListModelForKey:nil];
    
    [listModel enumerateObjectsUsingBlock:^(UserModel *userModel, NSUInteger idx, BOOL *stop) {
        NSLog(@"数组：%@-%@",userModel.name,@(userModel.age));
    }];
    
}





@end

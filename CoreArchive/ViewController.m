//
//  ViewController.m
//  CoreArchive
//
//  Created by muxi on 15/3/6.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"
#import "FBShimmeringView.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self show];
    
    UserModel *userModel = [[UserModel alloc] init];
    
    userModel.name = @"张三";
    
    userModel.age = 27;
    
    BOOL res = [UserModel saveSingleModel:userModel];
    
    if(res){
        NSLog(@"保存成功");
    }else{
        NSLog(@"保存失败");
    }
    
//    //删除本地归档
//    [UserModel save:nil];
    
    //保存一个数组
    BOOL res2 = [UserModel saveListModel:@[userModel]];
}




-(void)show{
    
    CGFloat wh = 136;
    
    CGFloat x = (320 - wh) * .5f;
    CGFloat y =100;
    
    FBShimmeringView *sv = [[FBShimmeringView alloc] initWithFrame:CGRectMake(x, y, wh, wh)];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:sv.bounds];
    imageV.image = [UIImage imageNamed:@"mj"];
    sv.contentView = imageV;
    sv.shimmering = YES;
    [self.view addSubview:sv];
    
    
}





-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //读取单个
    UserModel *userModel =[UserModel readSingleModel];
    
    NSLog(@"单个：%@-%@",userModel.name,@(userModel.age));
    
    
    //读取数组
    NSArray *listModel = [UserModel readListModel];
    
    [listModel enumerateObjectsUsingBlock:^(UserModel *userModel, NSUInteger idx, BOOL *stop) {
        NSLog(@"数组：%@-%@",userModel.name,@(userModel.age));
    }];
    
}





@end

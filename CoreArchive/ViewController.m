//
//  ViewController.m
//  CoreArchive
//
//  Created by muxi on 15/3/6.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserModel *userModel = [[UserModel alloc] init];
    
    userModel.name = @"张三";
    
    userModel.age = 27;
    
    BOOL res = [UserModel save:userModel];
    
    if(res){
        NSLog(@"保存成功");
    }else{
        NSLog(@"保存失败");
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UserModel *userModel =[UserModel read];
    
    
}





@end

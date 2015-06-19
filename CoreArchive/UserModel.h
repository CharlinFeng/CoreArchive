//
//  UserModel.h
//  CoreArchive
//
//  Created by 冯成林 on 15/6/1.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreArchive.h"


@interface UserModel : NSObject

CoreArchiver_MODEL_H


@property (nonatomic,copy) NSString *name;

@property (nonatomic,assign) NSUInteger age;


@end

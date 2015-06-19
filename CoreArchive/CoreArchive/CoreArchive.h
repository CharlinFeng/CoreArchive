//
//  ToolArc.h
//  私人通讯录
//
//  Created by muxi on 14-9-3.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSString+ArcFile.h"
#import "NSObject+MJCoding.h"

/** 自动存储宏定义 */
#define CoreArchiver_SingCACHE_PATH [[NSString cachesFolder] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.arc",NSStringFromClass(self)]]

#define CoreArchiver_ArrayCACHE_PATH [[NSString cachesFolder] stringByAppendingPathComponent:[NSString stringWithFormat:@"Array%@.arc",NSStringFromClass(self)]]

#define CoreArchiver_MODEL_H \
+(BOOL)saveSingleModel:(id)model;\
+(instancetype)readSingleModel;\
+(BOOL)saveListModel:(NSArray *)ListModel;\
+(NSArray *)readListModel;\


#define CoreArchiver_MODEL_M \
MJCodingImplementation\
+(BOOL)saveSingleModel:(id)model{\
return [CoreArchive archiveRootObject:model toFile:CoreArchiver_SingCACHE_PATH];\
}\
+(instancetype)readSingleModel{\
return [CoreArchive unarchiveObjectWithFile:CoreArchiver_SingCACHE_PATH];\
}\
+(BOOL)saveListModel:(NSArray *)ListModel{\
return [CoreArchive archiveRootObject:ListModel toFile:CoreArchiver_ArrayCACHE_PATH];\
}\
+(NSArray *)readListModel{\
return [CoreArchive unarchiveObjectWithFile:CoreArchiver_ArrayCACHE_PATH];\
}\







@interface CoreArchive : NSObject

#pragma mark - 偏好类信息存储

/**
 *  保存Str
 */
+(void)setStr:(NSString *)str key:(NSString *)key;

/**
 *  读取Str
 */
+(NSString *)strForKey:(NSString *)key;

/**
 *  删除Str
 */
+(void)removeStrForKey:(NSString *)key;




/**
 *  保存int
 */
+(void)setInt:(NSInteger)i key:(NSString *)key;

/**
 *  读取int
 */
+(NSInteger)intForKey:(NSString *)key;


/**
 *  删除int
 */
+(void)removeIntForKey:(NSString *)key;



/**
 *  保存float
 */
+(void)setFloat:(CGFloat)floatValue key:(NSString *)key;

/**
 *  读取float
 */
+(CGFloat)floatForKey:(NSString *)key;

/**
 *  删除float
 */
+(void)removeFloatForKey:(NSString *)key;


/**
 *  保存double
 */
+(void)setDouble:(double)doubleValue key:(NSString *)key;


/**
 *  读取double
 */
+(double)doubleForKey:(NSString *)key;

/**
 *  删除
 */
+(void)removeDoubleForKey:(NSString *)key;



/**
 *  保存bool
 */
+(void)setBool:(BOOL)boolValue key:(NSString *)key;

/**
 *  读取bool
 */
+(BOOL)boolForKey:(NSString *)key;

/**
 *  删除
 */
+(void)removeBoolForKey:(NSString *)key;


#pragma mark - 文件归档

/**
 *  归档
 */
+(BOOL)archiveRootObject:(id)obj toFile:(NSString *)path;
/**
 *  删除
 */
+(BOOL)removeRootObjectWithFile:(NSString *)path;

/**
 *  解档
 */
+(id)unarchiveObjectWithFile:(NSString *)path;






@end

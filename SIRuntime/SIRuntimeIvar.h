//
//  SIRntimeIvar.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 15/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <objc/runtime.h>
#import "SIRuntimeEncoding.h"

@interface SIRuntimeIvar : NSObject

/// 对应runtime的ivar
@property (nonatomic,assign,readonly) Ivar ivar ;

/// 变量名称
@property (nonatomic,strong,readonly) NSString *name ;
/// 变量EnCode类型
@property (nonatomic,strong,readonly) SIRuntimeEncoding *type ;
/// 变量偏移量
@property (nonatomic,assign,readonly) NSInteger offset ;

/// 获取对象的变量值
- (id)valueOfObject:(NSObject *)obj ;

/// 根据Ivar创建
- (instancetype)initWithIvar:(Ivar)ivar ;
/// 根据Ivar创建
+ (instancetype)runtimeIvarWithIvar:(Ivar)ivar ;

/// 根据变量详细信息创建
- (instancetype)initWithName:(NSString *)name typeEncoding:(SIRuntimeEncoding *)type offset:(ptrdiff_t)offset ;
/// 根据变量详细信息创建
+ (instancetype)runtimeIvarWithName:(NSString *)name typeEncoding:(SIRuntimeEncoding *)type offset:(ptrdiff_t)offset;

@end

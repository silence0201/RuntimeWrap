//
//  SIRuntimeMethod.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <objc/runtime.h>
#import "SIRuntimeEncoding.h"

@interface SIRuntimeMethod : NSObject

/// 对应runtime的method
@property (nonatomic,readonly) Method method ;

/// Method对应SEL
@property (nonatomic,readonly) SEL selector ;
/// Method对应IMP
@property (nonatomic,readonly) IMP implement ;
/// Method对应的typeEncoding
@property (nonatomic,readonly) NSString *typeEncoding ;
/// Method参数类型
@property (nonatomic,readonly) NSArray<SIRuntimeEncoding *>*argumentsTypes ;
/// Method返回参数类型
@property (nonatomic,readonly) SIRuntimeEncoding *returnType ;
/// Method参数数量
@property (nonatomic,readonly) NSUInteger argumentCount ;

/// 改变实现
- (void)exchangeImplementationsWithMethod:(SIRuntimeMethod *)anotherMethod;

/// 通过Method创建
- (instancetype)initWithMethod:(Method)method ;
/// 通过Method创建
+ (instancetype)runtimeMethodWithMethod:(Method)method ;

/// 通过详细信息创建
- (instancetype)initWithSelector:(SEL)sel implementation:(IMP)imp typeEncoding:(NSString *)type ;
/// 通过详细信息创建
+ (instancetype)runtimeMethodWithSelector:(SEL)sel implementation:(IMP)imp typeEncoding:(NSString *)type ;

@end

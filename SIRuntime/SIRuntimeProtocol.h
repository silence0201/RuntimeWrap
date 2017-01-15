//
//  SIRuntimeProtocol.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 15/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntimeMethod.h"

@interface SIRuntimeProtocol : NSObject

/// 对应runtime的Protocol
@property (nonatomic,readonly) Protocol *protocol ;
/// 属性名
@property (nonatomic,readonly) NSString *name ;

/// 获取属性某个方法
- (SIRuntimeMethod *)methodIsRequired:(BOOL)isRequired withName:(NSString *)name AndIsInstanceMethod:(BOOL)isInstanceMethod ;
/// 获取属性所有方法
- (NSArray<SIRuntimeMethod *> *)methodsIsRequired:(BOOL)isRequired AndIsInstanceMethod:(BOOL)isInstanceMethod ;

/// 根据Protocol创建
- (instancetype)initWithProtocol:(Protocol *)protocol ;
/// 根据Protocol创建
+ (instancetype)runtimeProtocolWithProtocol:(Protocol *)protocol ;

/// 根据name创建
- (instancetype)initWithName:(NSString *)name ;
/// 根据name创建
+ (instancetype)runtimeProtocolWithName:(NSString *)name;

@end

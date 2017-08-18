//
//  SIRuntimeClass.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 15/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntimeMethod.h"
#import "SIRuntimeProtocol.h"
#import "SIRuntimeProperty.h"
#import "SIRuntimeIvar.h"

@interface SIRuntimeClass : NSObject

/// 对应runtime的clazz
@property (nonatomic,readonly) Class clazz ;

/// 创建一个指定名称的类,父类为空
- (instancetype)initWithName:(NSString *)name;
/// 指定父类创建类
- (instancetype)initWithName:(NSString *)name superclass:(Class)superclass;

/// 给当前类添加参数
- (BOOL)addIvar:(SIRuntimeIvar *)ivar;
/// 给当前类添加方法
- (BOOL)addMethod:(SIRuntimeMethod *)method;
/// 给当前类添加协议
- (BOOL)addProtocol:(SIRuntimeProtocol *)protocol;

/// 将创建的类添加到系统中
- (Class)registerClass;

@end

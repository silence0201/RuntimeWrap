//
//  SIRuntime.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntimeClass.h"

@interface SIRuntime : NSObject

@property (nonatomic,readonly) Class clazz ;

/// 获取类名
- (NSString *)className ;
/// 获取父类名
- (NSString *)superClassName ;
/// 获取类版本信息
- (int)classVersion ;

/// 是否是元类
- (BOOL)isMetaClass ;

/// 删除某类
+ (void)removeClass:(SIRuntimeClass *)clazz ;
/// 添加某类
+ (void)addNewClass:(SIRuntimeClass *)clazz ;

/// 实例Size
- (size_t)instanceSize ;

/// 所有的父类
- (NSArray<Class> *)subclasses ;

/// 枚举所有的类
+ (void)enumerateClassesUsingBlock:(void (^)(Class cls, NSUInteger idx, BOOL *stop))block ;
/// 加载Lib信息
+ (NSArray<NSString *> *)loadedLibraries ;
/// 某个类的Lib
+ (NSString *)libraryOfClass:(Class)cls ;
/// 某个Lib的类信息
+ (NSArray<NSString *> *)classNamesInLibrary:(NSString *)library ;

/// 获取所有的属性信息
- (NSArray<SIRuntimeProperty *> *)propertyListWithEnumrated:(BOOL)enumrated ;
/// 根据名称获取属性信息
- (SIRuntimeProperty *)propertyWithName:(NSString *)name ;

/// 获取关联变量
- (id)getAssociatedProperty:(SEL)getter;
/// 关联变量
- (void)addAssociatedProperty:(SEL)getter value:(id)value policy:(objc_AssociationPolicy)policy;
/// 移除关联的信息
- (void)removeAssociatedProperties;

/// 实例方法数组
- (NSArray<SIRuntimeMethod *> *)instanceMethodList ;
/// 类方法数组
- (NSArray<SIRuntimeMethod *> *)classMethodList ;

/// 根据名称获取方法
- (SIRuntimeMethod *)instanceMethodWithName:(NSString *)name ;
/// 根据名称获取类方法
- (SIRuntimeMethod *)classMethodWithName:(NSString *)name ;
/// 根据SEL获取IMP
- (IMP)methodImplementation:(SEL)selector ;
/// 替换方法的实现
- (IMP)replaceMethod:(SIRuntimeMethod *)method with:(SIRuntimeMethod *)otherMethod ;
/// 交换方法的实现
- (void)swizzleMethod:(SIRuntimeMethod *)method with:(SIRuntimeMethod *)swizzledMethod ;
/// 添加方法
- (BOOL)addMethod:(SIRuntimeMethod *)method ;

/// 获取参数列表
- (NSArray<SIRuntimeIvar *>*)ivarsListWithEnumrated:(BOOL)enumrated ;
/// 根据名称获取参数信息
- (SIRuntimeIvar *)ivarWithName:(NSString *)name ;

/// 获取参数值
- (id)valueOfIvar:(SIRuntimeIvar *)ivar;
/// 设置参数值
- (void)setValue:(id)value forIvar:(SIRuntimeIvar *)ivar;

/// 获取协议列表
- (NSArray<SIRuntimeProtocol *>*)protocolListWithEnumrated:(BOOL)enumrated ;
/// 获取指定名称协议
- (SIRuntimeProtocol *)protocolWithName:(NSString *)name ;

/// 通过对象创建
- (instancetype)initWithObj:(id)obj ;
/// 通过对象创建
+ (instancetype)runtimeWithObj:(id)obj ;

/// 通过类创建
- (instancetype)initWithClass:(Class)clazz ;
/// 通过类创建
+ (instancetype)runtimeWithClass:(Class)clazz ;

@end

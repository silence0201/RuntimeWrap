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

- (NSString *)className ;
- (NSString *)superClassName ;
- (int)classVersion ;

- (BOOL)isMetaClass ;

+ (void)removeClass:(SIRuntimeClass *)clazz ;
+ (void)addNewClass:(SIRuntimeClass *)clazz ;

- (size_t)instanceSize ;

- (NSArray<Class> *)subclasses ;

+ (void)enumerateClassesUsingBlock:(void (^)(Class cls, NSUInteger idx, BOOL *stop))block ;
+ (NSArray<NSString *> *)loadedLibraries ;
+ (NSString *)libraryOfClass:(Class)cls ;
+ (NSArray<NSString *> *)classNamesInLibrary:(NSString *)library ;

- (NSArray<SIRuntimeProperty *> *)propertyListWithEnumrated:(BOOL)enumrated ;
- (SIRuntimeProperty *)propertyWithName:(NSString *)name ;

- (id)getAssociatedProperty:(SEL)getter;
- (void)addAssociatedProperty:(SEL)getter value:(id)value policy:(objc_AssociationPolicy)policy;
- (void)removeAssociatedProperties;

- (NSArray<SIRuntimeMethod *> *)instanceMethodList ;
- (NSArray<SIRuntimeMethod *> *)classMethodList ;

- (SIRuntimeMethod *)instanceMethodWithName:(NSString *)name ;
- (SIRuntimeMethod *)classMethodWithName:(NSString *)name ;
- (IMP)methodImplementation:(SEL)selector ;
- (IMP)replaceMethod:(SIRuntimeMethod *)method with:(SIRuntimeMethod *)otherMethod ;
- (void)swizzleMethod:(SIRuntimeMethod *)method with:(SIRuntimeMethod *)swizzledMethod ;
- (BOOL)addMethod:(SIRuntimeMethod *)method ;

- (NSArray<SIRuntimeIvar *>*)ivarsListWithEnumrated:(BOOL)enumrated ;
- (SIRuntimeIvar *)ivarWithName:(NSString *)name ;

- (id)valueOfIvar:(SIRuntimeIvar *)ivar;
- (void)setValue:(id)value forIvar:(SIRuntimeIvar *)ivar;

- (NSArray<SIRuntimeProtocol *>*)protocolListWithEnumrated:(BOOL)enumrated ;
- (SIRuntimeProtocol *)protocolWithName:(NSString *)name ;


- (instancetype)initWithObj:(id)obj ;
+ (instancetype)runtimeWithObj:(id)obj ;

@end

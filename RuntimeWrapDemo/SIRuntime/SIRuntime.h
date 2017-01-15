//
//  SIRuntime.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SIRuntimeProperty.h"
#import "SIRuntimeMethod.h"
#import "SIRuntimeIvar.h"

@interface SIRuntime : NSObject

@property (nonatomic,readonly) Class clazz ;

- (NSString *)className ;
- (NSString *)superClassName ;
- (int)classVersion ;

- (NSArray<SIRuntimeProperty *> *)propertyListWithEnumrated:(BOOL)enumrated ;
- (SIRuntimeProperty *)propertyWithName:(NSString *)name ;

- (NSArray<SIRuntimeMethod *> *)instanceMethodList ;
- (NSArray<SIRuntimeMethod *> *)classMethodList ;

- (SIRuntimeMethod *)instanceMethodWithName:(NSString *)name ;
- (SIRuntimeMethod *)classMethodWithName:(NSString *)name ;

- (NSArray<SIRuntimeIvar *>*)ivarsListWithEnumrated:(BOOL)enumrated ;
- (SIRuntimeIvar *)ivarWithName:(NSString *)name ;


- (instancetype)initWithClass:(Class)clazz ;
+ (instancetype)runtimeWithClass:(Class)clazz ;

@end

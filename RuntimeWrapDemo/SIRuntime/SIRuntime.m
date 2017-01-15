//
//  SIRuntime.m
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntime.h"
#import <objc/runtime.h>

@implementation SIRuntime{
    NSMutableArray<SIRuntimeProperty *> *propertyList ;
    NSMutableArray<SIRuntimeIvar *>* ivarList ;
}

- (instancetype)initWithClass:(Class)clazz{
    if (self = [super init]) {
        _clazz = clazz ;
    }
    return self ;
}

+ (instancetype)runtimeWithClass:(Class)clazz{
    return [[self alloc]initWithClass:clazz] ;
}

- (NSArray<SIRuntimeProperty *> *)propertyListWithEnumrated:(BOOL)enumrated{
    if (!_clazz) {
        return nil ;
    }
    if (propertyList) {
        [propertyList removeAllObjects] ;
    }else{
        propertyList = [NSMutableArray array] ;
    }
    

    
    [self addpropertyFromClass:_clazz] ;
    
    if (enumrated) {
        Class currentClass = _clazz ;
        while ([currentClass superclass]) {
            currentClass = [currentClass superclass] ;
            if (currentClass) {
                [self addpropertyFromClass:currentClass] ;
            }
        }

    }
    
    return propertyList ;
    
}

- (SIRuntimeProperty *)propertyWithName:(NSString *)name{
    objc_property_t property = class_getProperty(_clazz, [name UTF8String]) ;
    NSString *nam = [NSString stringWithUTF8String:property_getName(property)] ;
    NSString *attributes = [NSString stringWithUTF8String:property_getAttributes(property)] ;
    SIRuntimeProperty *runtimeProperty = [SIRuntimeProperty runtimePropertyWithName:nam andAttributes:attributes] ;
    return runtimeProperty ;
}

- (void)addpropertyFromClass:(Class)clazz{
    unsigned int outCount ;
    objc_property_t *properties = class_copyPropertyList(clazz, &outCount) ;
    for (int i  = 0 ; i < outCount ; i++){
        objc_property_t property = properties[i] ;
        NSString *name = [NSString stringWithUTF8String:property_getName(property)] ;
        NSString *attributes = [NSString stringWithUTF8String:property_getAttributes(property)] ;
        SIRuntimeProperty *runtimeProperty = [SIRuntimeProperty runtimePropertyWithName:name andAttributes:attributes] ;
        [propertyList addObject:runtimeProperty] ;
    }
    free(properties) ;
}

- (void)addIvarListFromClass:(Class)clazz{
    unsigned int outCount ;
    Ivar *list = class_copyIvarList(clazz, &outCount) ;
    for(int i = 0 ; i < outCount ;i++){
        Ivar iva = list[i] ;
        SIRuntimeIvar *ivar = [SIRuntimeIvar runtimeIvarWithIvar:iva] ;
        [ivarList addObject:ivar] ;
    }
}

- (NSArray<SIRuntimeMethod *> *)instanceMethodList{
    if (class_isMetaClass(_clazz)) return nil ;
    NSMutableArray *methodList = [NSMutableArray array] ;
    unsigned int outCount ;
    Method *list = class_copyMethodList(_clazz, &outCount) ;
    for (int i = 0 ; i < outCount ; i++){
        Method m = list[i] ;
        SIRuntimeMethod *method = [SIRuntimeMethod runtimeMethodWithMethod:m] ;
        [methodList addObject:method] ;
    }
    free(list) ;
    return methodList ;
}

- (NSArray<SIRuntimeMethod *> *)classMethodList{
    Class metaClazz  = class_isMetaClass(_clazz)?_clazz : object_getClass(_clazz) ;
    NSMutableArray *methodList = [NSMutableArray array] ;
    unsigned int outCount ;
    Method *list = class_copyMethodList(metaClazz, &outCount) ;
    for (int i = 0 ; i < outCount ; i++){
        Method m = list[i] ;
        SIRuntimeMethod *method = [SIRuntimeMethod runtimeMethodWithMethod:m] ;
        [methodList addObject:method] ;
    }
    free(list) ;
    return methodList ;
}

- (SIRuntimeMethod *)instanceMethodWithName:(NSString *)name{
    if(!name) return nil ;
    SIRuntimeMethod *method ;
    SEL selector = NSSelectorFromString(name) ;
    Method m = class_getInstanceMethod(_clazz, selector) ;
    if(m){
        method = [SIRuntimeMethod runtimeMethodWithMethod:m] ;
    }
    return method ;
}

- (SIRuntimeMethod *)classMethodWithName:(NSString *)name{
    if(!name) return nil ;
    SIRuntimeMethod *method ;
    SEL selector = NSSelectorFromString(name) ;
    Method m = class_getClassMethod(_clazz, selector) ;
    if(m){
        method = [SIRuntimeMethod runtimeMethodWithMethod:m] ;
    }
    return method ;
}

- (NSArray<SIRuntimeIvar *> *)ivarsListWithEnumrated:(BOOL)enumrated{
    if (!_clazz) {
        return nil ;
    }
    if (ivarList) {
        [ivarList removeAllObjects] ;
    }else{
        ivarList = [NSMutableArray array] ;
    }
    [self addIvarListFromClass:_clazz] ;
    if (enumrated) {
        Class currentClass = _clazz ;
        while ([currentClass superclass]) {
            currentClass = [currentClass superclass] ;
            if (currentClass) {
                [self addIvarListFromClass:currentClass] ;
            }
        }
        
    }
    return ivarList ;
}

- (SIRuntimeIvar *)ivarWithName:(NSString *)name{
    Ivar iva = class_getInstanceVariable(_clazz, name.UTF8String) ;
    return iva ? [SIRuntimeIvar runtimeIvarWithIvar:iva] : nil ;
}

- (NSString *)className{
    return [NSString stringWithUTF8String:object_getClassName(_clazz)] ;
}

- (NSString *)superClassName{
    Class superClass = class_getSuperclass(_clazz) ;
    return [NSString stringWithUTF8String:object_getClassName(superClass)] ;
}

- (int)classVersion{
    return class_getVersion(_clazz) ;
}

@end

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
    NSMutableArray<SIRuntimeProtocol *>* protocolList ;
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
    free(list) ;
}

- (void)addProtocolFromClass:(Class)clazz{
    unsigned int outCount ;
    Protocol * __unsafe_unretained *list = class_copyProtocolList(clazz, &outCount);
    for(int i = 0 ; i < outCount ;i++){
        Protocol* protocol = list[i] ;
        SIRuntimeProtocol *p = [SIRuntimeProtocol runtimeProtocolWithProtocol:protocol] ;
        [protocolList addObject:p] ;
    }
    free(list) ;
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

- (NSArray<SIRuntimeProtocol *> *)protocolListWithEnumrated:(BOOL)enumrated{
    if (!_clazz) {
        return nil ;
    }
    if (protocolList) {
        [protocolList removeAllObjects] ;
    }else{
        protocolList = [NSMutableArray array] ;
    }
    
    [self addProtocolFromClass:_clazz] ;
    
    if (enumrated) {
        Class currentClass = _clazz ;
        while ([currentClass superclass]) {
            currentClass = [currentClass superclass] ;
            if (currentClass) {
                [self addProtocolFromClass:currentClass] ;
            }
        }
        
    }
    
    return protocolList ;
}

- (SIRuntimeProtocol *)protocolWithName:(NSString *)name{
    SIRuntimeProtocol *protocol = [SIRuntimeProtocol runtimeProtocolWithName:name] ;
    if(protocol.protocol) return protocol ;
    return nil;
}

- (void)addAssociatedProperty:(SEL)getter value:(id)value policy:(objc_AssociationPolicy)policy {
    objc_setAssociatedObject(self, getter, value, policy);
}

- (id)getAssociatedProperty:(SEL)getter {
    return objc_getAssociatedObject(self, getter);
}

- (void)removeAssociatedProperties {
    objc_removeAssociatedObjects(self);
}

- (id)valueOfIvar:(SIRuntimeIvar *)ivar {
    return object_getIvar(self, ivar.ivar);
}

- (void)setValue:(id)value forIvar:(SIRuntimeIvar *)ivar {
    object_setIvar(self, ivar.ivar, value);
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

- (Class)setSuperclass:(Class)superclass {
    return class_setSuperclass(_clazz, superclass);
}

- (BOOL)isMetaClass{
    return class_isMetaClass(_clazz) ;
}

- (void)removeClass{
    objc_disposeClassPair(_clazz) ;
}

- (size_t)instanceSize{
    return class_getInstanceSize(_clazz) ;
}

- (NSArray<Class> *)subclasses{
    NSMutableArray<Class> *array = [NSMutableArray array];
    Class currentClass = _clazz ;
    while ([currentClass superclass]) {
        [array addObject:[currentClass superclass]] ;
    }
    return array ;
}

+ (void)enumerateClassesUsingBlock:(void (^)(Class cls, NSUInteger idx, BOOL *stop))block {
    if (!block) return;
    Class *classes = NULL;
    int n, size; BOOL stop = NO;
    do {
        n = objc_getClassList(NULL, 0);
        classes = (Class *)realloc(classes, n * sizeof(*classes));
        size = objc_getClassList(classes, n);
    } while (size != n);
    if (classes) {
        for (unsigned int i = 0; i < n && !stop; ++i) {
            block(classes[i], i, &stop);
        }
        free(classes);
    }
}

+ (NSArray<NSString *> *)loadedLibraries {
    unsigned int count;
    const char **names = objc_copyImageNames(&count);
    if (names) {
        NSMutableArray<NSString *> *array = [NSMutableArray arrayWithCapacity:count];
        for (unsigned int i = 0; i < count; ++i) {
            [array addObject:[NSString stringWithUTF8String:names[i]]];
        }
        free(names);
        return array;
    }
    return nil;
}

+ (NSString *)libraryOfClass:(Class)cls {
    return [NSString stringWithUTF8String:class_getImageName(cls)];
}

+ (NSArray<NSString *> *)classNamesInLibrary:(NSString *)library {
    unsigned int count;
    const char **names = objc_copyClassNamesForImage(library.UTF8String, &count);
    if (names) {
        NSMutableArray<NSString *> *array = [NSMutableArray arrayWithCapacity:count];
        for (unsigned int i = 0; i < count; ++i) {
            [array addObject:[NSString stringWithUTF8String:names[i]]];
        }
        free(names);
        return array;
    }
    return nil;
}



@end

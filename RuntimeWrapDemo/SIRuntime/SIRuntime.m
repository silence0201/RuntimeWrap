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
    
    return [propertyList copy] ;
    
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

@end

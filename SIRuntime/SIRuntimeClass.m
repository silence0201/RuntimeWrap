//
//  SIRuntimeClass.m
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 15/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntimeClass.h"

@implementation SIRuntimeClass

- (instancetype)initWithName:(NSString *)name {
    return [self initWithName:name superclass:nil];
}

- (instancetype)initWithName:(NSString *)name superclass:(__unsafe_unretained Class)superclass {
    if ((self = [self init])) {
        _clazz = objc_allocateClassPair(superclass, name.UTF8String, 0);
    }
    return _clazz ? self : nil;
}

- (BOOL)addIvar:(SIRuntimeIvar *)ivar {
    const char *type = ivar.type.code.UTF8String;
    NSUInteger size, alignment;
    NSGetSizeAndAlignment(type, &size, &alignment);
    return class_addIvar(_clazz, ivar.name.UTF8String, size, log2(alignment), type);
}

- (BOOL)addMethod:(SIRuntimeMethod *)method {
    return class_addMethod(_clazz, method.selector, method.implement, method.typeEncoding.UTF8String);
}

- (BOOL)addProtocol:(SIRuntimeProtocol *)protocol{
    return class_addProtocol(_clazz, protocol.protocol);
}

- (Class)registerClass {
    objc_registerClassPair(_clazz);
    return _clazz;
}

@end

//
//  SIRuntimeProtocol.m
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 15/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntimeProtocol.h"
#import <objc/runtime.h>

@implementation SIRuntimeProtocol

- (instancetype)initWithProtocol:(Protocol *)protocol{
    if(self = [super init]){
        _protocol = protocol ;
        _name = [NSString stringWithUTF8String:protocol_getName(protocol)] ;
    }
    return self ;
}

+ (instancetype)runtimeProtocolWithProtocol:(Protocol *)protocol{
    return [[self alloc]initWithProtocol:protocol] ;
}

- (instancetype)initWithName:(NSString *)name{
    if (self = [super init]) {
        _protocol = objc_getProtocol(name.UTF8String) ;
        _name = name ;
    }
    return self ;
}

+ (instancetype)runtimeProtocolWithName:(NSString *)name{
    return [[self alloc]initWithName:name] ;
}

- (SIRuntimeMethod *)methodIsRequired:(BOOL)isRequired withName:(NSString *)name AndIsInstanceMethod:(BOOL)isInstanceMethod{
    if (!_protocol) return nil ;
    struct objc_method_description methodDesc = protocol_getMethodDescription(_protocol, NSSelectorFromString(name), isRequired, isInstanceMethod) ;
    NSString *type = [NSString stringWithUTF8String:methodDesc.types] ;
    SIRuntimeMethod *method = [SIRuntimeMethod runtimeMethodWithSelector:NSSelectorFromString(name) implementation:NULL typeEncoding:type] ;
    return method ;
}

- (NSArray<SIRuntimeMethod *> *)methodsIsRequired:(BOOL)isRequired AndIsInstanceMethod:(BOOL)isInstanceMethod{
    if (!_protocol) return nil ;
    NSMutableArray *array = [NSMutableArray array] ;
    unsigned int count;
    struct objc_method_description *methodsDesc = protocol_copyMethodDescriptionList(self.protocol, isRequired, isInstanceMethod, &count) ;
    for(int i = 0 ;i<count ; i++){
        NSString *type = [NSString stringWithUTF8String:methodsDesc[i].types] ;
        SIRuntimeMethod *method = [SIRuntimeMethod runtimeMethodWithSelector:methodsDesc[i].name implementation:NULL typeEncoding:type] ;
        [array addObject:method] ;
    }
    return array ;
}

@end

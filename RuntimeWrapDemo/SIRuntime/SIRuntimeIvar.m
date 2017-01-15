//
//  SIRntimeIvar.m
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 15/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntimeIvar.h"

@implementation SIRuntimeIvar

- (instancetype)initWithIvar:(Ivar)ivar{
    if (self = [super init]) {
        _ivar = ivar ;
        _name = [NSString stringWithUTF8String:ivar_getName(ivar)] ;
        _type = [SIRuntimeEncoding runtimeEncodingWithCode:[NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)]] ;
        _offset = ivar_getOffset(ivar) ;
    }
    return self ;
}

+ (instancetype)runtimeIvarWithIvar:(Ivar)ivar{
    return [[self alloc]initWithIvar:ivar] ;
}

- (id)valueOfObject:(NSObject *)obj{
    Ivar ivar = class_getInstanceVariable([obj class], _name.UTF8String) ;
    if (ivar) {
        return object_getIvar(obj, ivar) ;
    }
    return nil ;
}

@end

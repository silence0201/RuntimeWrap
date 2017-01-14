//
//  SIRuntime.m
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntime.h"

@implementation SIRuntime

- (instancetype)initWithClass:(Class)clazz{
    if (self = [super init]) {
        _clazz = clazz ;
    }
    return self ;
}

+ (instancetype)runtimeWithClass:(Class)clazz{
    return [[self alloc]initWithClass:clazz] ;
}

@end

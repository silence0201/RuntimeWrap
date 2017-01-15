//
//  SIRuntimeMethod.m
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntimeMethod.h"

@implementation SIRuntimeMethod

- (instancetype)initWithMethod:(Method)method{
    if (self = [super init]) {
        _method = method ;
        _selector = method_getName(_method)  ;
        _implement = method_getImplementation(_method) ;
        _argumentCount = method_getNumberOfArguments(_method) ;
        _typeEncoding = [NSString stringWithUTF8String:method_getTypeEncoding(_method)] ;
        _argumentsTypes = [self getArgumentsTypes] ;
        _returnType = [self getReturnType] ;
    }
    return self ;
}

+ (instancetype)runtimeMethodWithMethod:(Method)method{
    return  [[self alloc] initWithMethod:method] ;
}

- (instancetype)initWithSelector:(SEL)sel implementation:(IMP)imp typeEncoding:(NSString *)type{
    if (self = [super init]) {
        _selector = sel ;
        _implement = imp ;
        _typeEncoding = type ;
    }
    return self ;
}

+ (instancetype)runtimeMethodWithSelector:(SEL)sel implementation:(IMP)imp typeEncoding:(NSString *)type{
    return [[self alloc]initWithSelector:sel implementation:imp typeEncoding:type] ;
}


- (NSArray<SIRuntimeEncoding *> *)getArgumentsTypes{
    unsigned int count = method_getNumberOfArguments(_method);
    NSMutableArray<SIRuntimeEncoding *> *array = [NSMutableArray array];
    for (unsigned int i = 0; i < count; ++i) {
        char *type = method_copyArgumentType(_method, i);
        if (type) {
            NSString *result = [NSString stringWithUTF8String:type];
            [array addObject:[SIRuntimeEncoding runtimeEncodingWithCode:result]];
            free(type);
        }
    }
    return array ;
}

- (SIRuntimeEncoding *)getReturnType{
    char *type = method_copyReturnType(_method);
    if (type) {
        NSString *result = [NSString stringWithUTF8String:type];
        SIRuntimeEncoding *ecd = [SIRuntimeEncoding runtimeEncodingWithCode:result] ;
        free(type);
        return ecd;
    }
    return nil;
}

- (void)exchangeImplementationsWithMethod:(SIRuntimeMethod *)anotherMethod{
    method_exchangeImplementations(_method, anotherMethod.method) ;
}




@end

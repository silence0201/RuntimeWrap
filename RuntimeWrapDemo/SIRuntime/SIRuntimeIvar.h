//
//  SIRntimeIvar.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 15/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <objc/runtime.h>
#import "SIRuntimeEncoding.h"

@interface SIRuntimeIvar : NSObject

@property (nonatomic,assign,readonly) Ivar ivar ;

@property (nonatomic,strong,readonly) NSString *name ;
@property (nonatomic,strong,readonly) SIRuntimeEncoding *type ;
@property (nonatomic,assign,readonly) NSInteger offset ;

- (id)valueOfObject:(NSObject *)obj ;

- (instancetype)initWithIvar:(Ivar)ivar ;
+ (instancetype)runtimeIvarWithIvar:(Ivar)ivar ;

- (instancetype)initWithName:(NSString *)name typeEncoding:(SIRuntimeEncoding *)type offset:(ptrdiff_t)offset ;
+ (instancetype)runtimeIvarWithName:(NSString *)name typeEncoding:(SIRuntimeEncoding *)type offset:(ptrdiff_t)offset;

@end

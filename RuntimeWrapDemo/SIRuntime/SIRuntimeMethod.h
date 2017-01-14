//
//  SIRuntimeMethod.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "SIRuntimeEncoding.h"

@interface SIRuntimeMethod : NSObject

@property (nonatomic,readonly) Method method ;

@property (nonatomic,readonly) SEL selector ;
@property (nonatomic,readonly) IMP implement ;
@property (nonatomic,readonly) NSString *typeEncoding ;

@property (nonatomic,readonly) NSArray<SIRuntimeEncoding *>*argumentsTypes ;
@property (nonatomic,readonly) SIRuntimeEncoding *returnType ;

@property (nonatomic,readonly) NSUInteger argumentCount ;

- (instancetype)initWithMethod:(Method)method ;
+ (instancetype)runtimeMethodWithMethod:(Method)method ;

@end

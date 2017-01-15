//
//  SIRuntimeClass.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 15/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntimeMethod.h"
#import "SIRuntimeProtocol.h"
#import "SIRuntimeProperty.h"
#import "SIRuntimeIvar.h"

@interface SIRuntimeClass : NSObject

@property (nonatomic,readonly) Class clazz ;

- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name superclass:(Class)superclass;

- (BOOL)addIvar:(SIRuntimeIvar *)ivar;
- (BOOL)addMethod:(SIRuntimeMethod *)method;
- (BOOL)addProtocol:(SIRuntimeProtocol *)protocol;

- (Class)registerClass;

@end

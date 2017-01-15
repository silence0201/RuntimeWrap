//
//  SIRuntimeProtocol.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 15/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SIRuntimeMethod.h"

@interface SIRuntimeProtocol : NSObject

@property (nonatomic,readonly) Protocol *protocol ;
@property (nonatomic,readonly) NSString *name ;

- (SIRuntimeMethod *)methodIsRequired:(BOOL)isRequired withName:(NSString *)name AndIsInstanceMethod:(BOOL)isInstanceMethod ;
- (NSArray<SIRuntimeMethod *> *)methodsIsRequired:(BOOL)isRequired AndIsInstanceMethod:(BOOL)isInstanceMethod ;

- (instancetype)initWithProtocol:(Protocol *)protocol ;
+ (instancetype)runtimeProtocolWithProtocol:(Protocol *)protocol ;

- (instancetype)initWithName:(NSString *)name ;
+ (instancetype)runtimeProtocolWithName:(NSString *)name;

@end

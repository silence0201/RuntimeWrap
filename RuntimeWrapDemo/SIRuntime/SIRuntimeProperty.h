//
//  SIRuntimeProperty.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SIRuntimeEncoding.h"
#import "SIRuntimePropertyType.h"

@interface SIRuntimeProperty : NSObject

@property (nonatomic,strong,readonly) NSString *name ;
@property (nonatomic,strong,readonly) NSString *attributes ;

@property (nonatomic,assign,readonly) Class clazz ;
@property (nonatomic,strong,readonly) NSString *structureName ;

@property (nonatomic,strong,readonly) SIRuntimeEncoding *propertyEncoding ;
@property (nonatomic,strong,readonly) SIRuntimePropertyType *propertyType ;

- (instancetype)initWithName:(NSString *)name andAttributes:(NSString *)attributes ;
+ (instancetype)runtimePropertyWithName:(NSString *)name andAttributes:(NSString *)attributes ;

@end

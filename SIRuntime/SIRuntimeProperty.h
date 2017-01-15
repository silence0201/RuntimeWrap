//
//  SIRuntimeProperty.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntimeEncoding.h"
#import "SIRuntimePropertyType.h"

@interface SIRuntimeProperty : NSObject

/// 属性名称
@property (nonatomic,strong,readonly) NSString *name ;
/// 对应变量名
@property (nonatomic,strong,readonly) NSString *varName ;
/// 属性描述
@property (nonatomic,strong,readonly) NSString *attributes ;

/// 属性对应类名,只有属性为Obj有效
@property (nonatomic,assign,readonly) Class clazz ;
/// 属性对应结构体名,只有属性为Struct有效
@property (nonatomic,strong,readonly) NSString *structureName ;

/// 属性Encode
@property (nonatomic,strong,readonly) SIRuntimeEncoding *propertyEncoding ;
/// 属性Type
@property (nonatomic,strong,readonly) SIRuntimePropertyType *propertyType ;

- (instancetype)initWithName:(NSString *)name andAttributes:(NSString *)attributes ;
+ (instancetype)runtimePropertyWithName:(NSString *)name andAttributes:(NSString *)attributes ;

@end

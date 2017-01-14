//
//  SIRuntimeProperty.m
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "SIRuntimeProperty.h"

@implementation SIRuntimeProperty

- (instancetype)initWithName:(NSString *)name andAttributes:(NSString *)attributes{
    if (self = [super init]) {
        _name = name ;
        _attributes = attributes ;
        _propertyType = [SIRuntimePropertyType runtimePropertyTypeWithAttributes:attributes] ;
        _propertyEncoding = [SIRuntimeEncoding runtimeEncodingWithAttributes:attributes] ;
        _structureName = [self structureNameWithAttributes:attributes] ;
        _clazz = [self classWithAttributes:attributes] ;
    }
    return self ;
}

+ (instancetype)runtimePropertyWithName:(NSString *)name andAttributes:(NSString *)attributes{
    return [[self alloc]initWithName:name andAttributes:attributes] ;
}

- (NSString *)structureNameWithAttributes:(NSString *)attributes{
    NSString *structureName = nil ;
    if(_propertyEncoding.isStructure){
        NSString *firstAttribute = [attributes componentsSeparatedByString:@","].firstObject ;
        if (firstAttribute.length > 3) {
            NSString *name = [firstAttribute substringWithRange:NSMakeRange(2, firstAttribute.length - 3)];
            NSArray *names = [name componentsSeparatedByString:@"="];
            structureName = names.firstObject;
        }
    }
    
    return structureName ;
}

- (Class)classWithAttributes:(NSString *)attibutes{
    Class clazz = nil ;
    if (_propertyEncoding.isObject) {
        NSString *firstAttribute = [attibutes componentsSeparatedByString:@","].firstObject ;
        if (firstAttribute.length > 3) {
            NSString *className = [firstAttribute substringWithRange:NSMakeRange(3, firstAttribute.length - 4)];
            NSArray *names = [className componentsSeparatedByString:@"<"];
            clazz = NSClassFromString(names.firstObject);
        }
    }
    return clazz ;
}

@end

//
//  SIRuntimePropertyType.m
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//  https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html#//apple_ref/doc/uid/TP40008048-CH101-SW5

#import "SIRuntimePropertyType.h"

@implementation SIRuntimePropertyType

- (instancetype)initWithAttributes:(NSString *)attributes{
    if (self = [super init]) {
        _attributes = attributes ;
        NSMutableString *typeDesc = [NSMutableString string] ;
        NSArray *attributeList = [attributes componentsSeparatedByString:@","] ;
        for(NSString *attribute in attributeList){
            NSString *code = [attribute substringToIndex:1] ;
            
            if ([@"R" isEqualToString:code]) {
                _isReadOnly = YES ;
                [typeDesc appendString:@"R,"] ;
            }else if([@"C" isEqualToString:code]){
                _isCopy = YES ;
                [typeDesc appendString:@"C,"] ;
            }else if([@"&" isEqualToString:code]){
                _isReatin = YES ;
                [typeDesc appendString:@"&,"] ;
            }else if([@"D" isEqualToString:code]){
                _isDynamic = YES ;
                [typeDesc appendString:@"D,"] ;
            }else if([@"W" isEqualToString:code]){
                _isWeakReference = YES ;
                [typeDesc appendString:@"W,"] ;
            }else if([@"G" isEqualToString:code]){
                _isCustomGetter = YES ;
                _customGetterName = [attribute substringFromIndex:1] ;
                [typeDesc appendFormat:@"G%@,",_customGetterName] ;
            }else if([@"S" isEqualToString:code]){
                _isCustomSetter = YES ;
                _customSettterName = [attribute substringFromIndex:1] ;
                [typeDesc appendFormat:@"S%@,",_customSettterName] ;
            }
        }
        
        if (typeDesc.length > 0) {
            _typeDesc = [typeDesc substringToIndex:typeDesc.length-1] ;
        }
        
    }
    return self ;
}

+ (instancetype)runtimePropertyTypeWithAttributes:(NSString *)attributes{
    return [[self alloc]initWithAttributes:attributes] ;
}

@end

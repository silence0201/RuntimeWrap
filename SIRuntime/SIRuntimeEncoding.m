//
//  SIRuntimeEncoding.m
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//  https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100-SW1

#import "SIRuntimeEncoding.h"

@implementation SIRuntimeEncoding

- (instancetype)initWithCode:(NSString *)code{
    if (self = [super init]) {
        [self inspectCode:code] ;
    }
    return self ;
}

+ (instancetype)runtimeEncodingWithCode:(NSString *)code{
    return [[self alloc]initWithCode:code] ;
}

- (instancetype)initWithAttributes:(NSString *)attributes{
    if(self = [super init]){
        NSString *firstAttribute = [attributes componentsSeparatedByString:@","].firstObject ;
        NSString *code = [firstAttribute substringFromIndex:1] ;
        [self inspectCode:code] ;
    }
    return self ;
}

+ (instancetype)runtimeEncodingWithAttributes:(NSString *)attributes{
    return [[self alloc]initWithAttributes:attributes] ;
}

- (void)inspectCode:(NSString *)code{
    _code = code ;
    
    // 类型判断
    if ([code hasPrefix:@"c"])       _isChar              = YES ;
    else if ([code hasPrefix:@"i"])  _isInt               = YES ;
    else if ([code hasPrefix:@"s"])  _isShort             = YES ;
    else if ([code hasPrefix:@"l"])  _isLong              = YES ;
    else if ([code hasPrefix:@"q"])  _isLongLong          = YES ;
    else if ([code hasPrefix:@"C"])  _isUnsignedChar      = YES ;
    else if ([code hasPrefix:@"I"])  _isUnsignedInt       = YES ;
    else if ([code hasPrefix:@"S"])  _isUnsignedShort     = YES ;
    else if ([code hasPrefix:@"L"])  _isUnsignedLong      = YES ;
    else if ([code hasPrefix:@"Q"])  _isUnsignedLongLong  = YES ;
    else if ([code hasPrefix:@"f"])  _isFloat             = YES ;
    else if ([code hasPrefix:@"d"])  _isDouble            = YES ;
    else if ([code hasPrefix:@"B"])  _isBool              = YES ;
    else if ([code hasPrefix:@"v"])  _isVoid              = YES ;
    else if ([code hasPrefix:@"*"])  _isCharString        = YES ;
    else if ([code hasPrefix:@"@"])  _isObject            = YES ;
    else if ([code hasPrefix:@"#"])  _isClass             = YES ;
    else if ([code hasPrefix:@":"])  _isMethodSelector    = YES ;
    else if ([code hasPrefix:@"["])  _isArray             = YES ;
    else if ([code hasPrefix:@"{"])  _isStructure         = YES ;
    else if ([code hasPrefix:@"("])  _isUnion             = YES ;
    else if ([code hasPrefix:@"b"])  _isBit               = YES ;
    else if ([code hasPrefix:@"^"])  _isPointer           = YES ;
    else if ([code hasPrefix:@"?"])  _isUnknown           = YES ;
    else if ([code hasPrefix:@"r"])  _isConst             = YES ;
    else if ([code hasPrefix:@"n"])  _isIn                = YES ;
    else if ([code hasPrefix:@"N"])  _isInOut             = YES ;
    else if ([code hasPrefix:@"o"])  _isOut               = YES ;
    else if ([code hasPrefix:@"O"])  _isByCopy            = YES ;
    else if ([code hasPrefix:@"R"])  _isByRef             = YES ;
    else if ([code hasPrefix:@"V"])  _isOneway            = YES ;
}


@end

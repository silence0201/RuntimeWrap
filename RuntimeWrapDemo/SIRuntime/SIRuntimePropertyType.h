//
//  SIRuntimePropertyType.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIRuntimePropertyType : NSObject

@property (nonatomic,strong,readonly) NSString *attributes ;
@property (nonatomic,strong,readonly) NSString *typeDesc ;

@property (nonatomic,assign,readonly) BOOL isReadOnly ;
@property (nonatomic,assign,readonly) BOOL isCopy ;
@property (nonatomic,assign,readonly) BOOL isReatin ;
@property (nonatomic,assign,readonly) BOOL isNonatomic ;
@property (nonatomic,assign,readonly) BOOL isDynamic ;
@property (nonatomic,assign,readonly) BOOL isWeakReference ;


@property (nonatomic,assign,readonly) BOOL isCustomSetter ;
@property (nonatomic,strong,readonly) NSString *customSettterName ;
@property (nonatomic,assign,readonly) BOOL isCustomGetter ;
@property (nonatomic,strong,readonly) NSString *customGetterName ;

- (instancetype)initWithAttributes:(NSString *)attributes;
+ (instancetype)runtimePropertyTypeWithAttributes:(NSString *)attributes ;

@end

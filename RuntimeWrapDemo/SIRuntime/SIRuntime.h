//
//  SIRuntime.h
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIRuntime : NSObject

@property (nonatomic,readonly) Class clazz ;

- (instancetype)initWithClass:(Class)clazz ;
+ (instancetype)runtimeWithClass:(Class)clazz ;



@end

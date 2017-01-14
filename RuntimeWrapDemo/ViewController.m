//
//  ViewController.m
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "ViewController.h"
#import "SIRuntime.h"
#import "SIRuntimeMethod.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic,strong) NSString *test ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SIRuntime *runtime = [SIRuntime runtimeWithClass:self.class] ;
    SIRuntimeProperty *t = [runtime propertyWithName:@"test"] ;
    
    NSLog(@"%@",NSStringFromClass(t.clazz)) ;
    NSLog(@"%@",t.varName) ;
    
    Method Method = class_getInstanceMethod(self.class, @selector(test:wit:)) ;
    SIRuntimeMethod *m = [SIRuntimeMethod runtimeMethodWithMethod:Method] ;
    NSLog(@"%@",m.typeEncoding) ;
    NSLog(@"%@",m.returnType) ;
    NSLog(@"%@",m.argumentsTypes) ;
}

- (NSString *)test:(NSString *)t wit:(NSString *)ii{
    NSLog(@"%@",t) ;
    return t ;
}



@end

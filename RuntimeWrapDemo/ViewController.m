//
//  ViewController.m
//  RuntimeWrapDemo
//
//  Created by 杨晴贺 on 14/01/2017.
//  Copyright © 2017 Silence. All rights reserved.
//

#import "ViewController.h"
#import "SIRuntime.h"

@interface ViewController ()

@property (nonatomic,strong) NSString *test ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SIRuntime *runtime = [SIRuntime runtimeWithClass:self.class] ;
    
    NSArray *array = [runtime propertyListWithEnumrated:YES] ;
    for(SIRuntimeProperty *property in array){
        if (property.propertyEncoding.isObject) {
            NSLog(@"%@",NSStringFromClass(property.clazz)) ;
        }else if(property.propertyEncoding.isStructure){
            NSLog(@"%@",property.structureName) ;
        }else{
            NSLog(@"%@",property.attributes) ;
        }
        
    }
}



@end

# RuntimeWrap
A Simple RuntimeWrap With Objective-C

使用说明
====
###安装
#####手工导入
将项目目录下`SIRuntime`导入项目中

###使用
1. 导入头文件

	```objective-c
	#import "SIRuntime.h"
	```
	
2. 创建`RuntimeWrap`

	```objective-c
	SIRuntime *runtime = [SIRuntime runtimeWithClass:self.class] ;
	SIRuntime *runtime = [SIRuntime runtimeWithClass:self] ;
	```
	
3. 注册新Class,使用`SIRuntimeClass`

	```objective-c
	/// SIRuntimeClass
	/// 创建一个指定名称的类,父类为空
	- (instancetype)initWithName:(NSString *)name;
	/// 指定父类创建类
	- (instancetype)initWithName:(NSString *)name superclass:(Class)superclass;

	/// SIRuntime
	/// 删除某类
	+ (void)removeClass:(SIRuntimeClass *)clazz ;
	/// 添加某类
	+ (void)addNewClass:(SIRuntimeClass *)clazz ;
	```
	
4. 更多方法,请查看`SIRuntime`注释
	
##RuntimeWrap
RuntimeWrap is available under the MIT license. See the LICENSE file for more info.
	

	
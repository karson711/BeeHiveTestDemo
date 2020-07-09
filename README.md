# BeeHiveTestDemo - 学习BeeHive组件化框架Demo

## 一、组件化

#### 通过构建中间层来组件化项目，共需要三步：

#### 1. 创建protocol

protocol表示模块对外暴露的接口，需要继承BeeHive中的协议BHServiceProtocol。

#### 2. 创建impClass

impClass是protocol对应的响应类，它需要遵守这个protocol协议，它可以是模块中一个已经存在的业务类，也可以是这个模块的一个封装类。

如果模块对外暴露的方法全部来自于同一个业务类，则可以将这个业务类设置成impClass；

如果模块对外暴露的方法全部来自于多个不同的业务类，则需要给这个模块创建一个封装类，通过这个封装类来实现对模块的调用，impClass指向这个封装类。

#### 3. 设置protocol-impClass映射关系

在BeeHive中，所有protocol-impClass的映射关系都由BHServiceManager管理，在BHServiceManager类中，有一个叫做allServicesDict的属性，它保存了所有的protocol-impClass的映射关系。

allServicesDict是一个可变字典，其中key是protocol的字符串名称，value是impClass的字符串名称。

###### 具体注册方式有下列三种

a. 使用BeeHive类的-[registerService:service:]
```
[[BeeHive shareInstance] registerService:@protocol(ModuleAServiceProtocol) service:[ModuleAService class]];
```

b. 使用宏BeeHiveService
```
@BeeHiveService(ModuleCServiceProtocol,ModuleCViewController)
```

c. 使用plist文件  
```
[BHContext shareInstance].serviceConfigName = @"BeeHive.bundle/BHService";
```

##### 调用具体实现类方法:
```
id<ModuleAServiceProtocol> moduleAService = [[BeeHive shareInstance] createService:@protocol(ModuleAServiceProtocol)];
```

## 二、事件分发

BeeHive本身会监听一些系统事件和应用事件，比如App生命周期、推送、handoff等，当事件发生时，BeeHive将其分发给各个模块，然后各个业务模块就可以在自己的Module类中调用各自的响应方法。

#### 实现事件分发，共需要三步：

#### 1、初始化Appdelegate需要继承BHAppdelegate
```
#import <UIKit/UIKit.h>
#import <BeeHive.h>

@interface AppDelegate : BHAppDelegate <UIApplicationDelegate>


@end
```
```
//AppDelegate.m

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [BHContext shareInstance].application = application;
    [BHContext shareInstance].launchOptions = launchOptions;
    [BHContext shareInstance].moduleConfigName = @"BeeHive.bundle/BeeHive";
    [BHContext shareInstance].serviceConfigName = @"BeeHive.bundle/BHService";
    
    [BeeHive shareInstance].enableException = YES;
    [[BeeHive shareInstance] setContext:[BHContext shareInstance]];
    
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    ...
    ...
    return YES;
}
```

#### 2、创建并注册Module类

每一个需要响应事件的模块，都需要新建一个对应的Module类，Module类需要遵循BHModuleProtocol协议。然后注册ModuleAModule类。
```
#import "ModuleAModule.h"
#import "BHService.h"

@BeeHiveMod(ModuleAModule)
@interface ModuleAModule() <BHModuleProtocol>
@end

@implementation ModuleAModule

- (void)modContinueUserActivity:(BHContext *)context{
    
    //实现具体的事件处理
    
}

@end
```
注册方式如下：
```
//注册Module 方式一
@BeeHiveMod(ModuleAModule)

//注册Module 方式二
[BeeHive registerDynamicModule:[ModuleAModule class]];
```
#### 3、调用响应方法
是在- (void)modContinueUserActivity:(BHContext *)context中进行的。
```
- (void)modContinueUserActivity:(BHContext *)context{
    //注册Module 方式二
//    [BeeHive registerDynamicModule:[ModuleAModule class]];
    
    NSUserActivity *userActivity = context.userActivityItem.userActivity;
    if ([userActivity.activityType isEqualToString:@"com.company.app.moduleA.one"]) {
    
        id<ModuleAServiceProtocol> moduleAService = [[BeeHive shareInstance] createService:@protocol(ModuleAServiceProtocol)];
        [moduleAService pushToModuleAOneViewController];
    }
}
```

附上简书地址：
https://www.jianshu.com/p/467e88875b11

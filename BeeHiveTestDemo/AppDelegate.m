//
//  AppDelegate.m
//  BeeHiveTestDemo
//
//  Created by jikun on 2020/7/8.
//  Copyright © 2020年 jikun. All rights reserved.d.
//


#import "BHService.h"

#import "TabbarViewController.h"
#import "AppDelegate.h"
#import "ModuleA/ModuleAService.h"
#import "ModuleB/ModuleBService.h"
#import "ModuleC/ModuleCViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [BHContext shareInstance].application = application;
    [BHContext shareInstance].launchOptions = launchOptions;
    
    //注册protocol和impClass映射关系方式一  plist文件注册
//    [BHContext shareInstance].moduleConfigName = @"BeeHive.bundle/BeeHive";
//    [BHContext shareInstance].serviceConfigName = @"BeeHive.bundle/BHService";
    
    //是否开启异常模式 - 一般在调试模式下，应该开启。生产模式下，应该关闭。
    [BeeHive shareInstance].enableException = NO;
    #ifdef DEBUG
        [BeeHive shareInstance].enableException = YES;
    #endif
    [[BeeHive shareInstance] setContext:[BHContext shareInstance]];
    
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    //注册protocol和impClass映射关系方式二
    [[BeeHive shareInstance] registerService:@protocol(ModuleAServiceProtocol) service:[ModuleAService class]];
    [[BeeHive shareInstance] registerService:@protocol(ModuleBServiceProtocol) service:[ModuleBService class]];

    TabbarViewController *tab = [[TabbarViewController alloc]init];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    
    return YES;
}


/*
 事件分发：
 1、将事件移动到ModuleAModule和ModuleBModule两个事件处理类中处理
 2、事件处理类要遵守BHModuleProtocol
 3、使用在BHAnnotation类中定义的宏BeeHiveMod传入类名即可完成注册，如：@BeeHiveMod(ModuleAModule)
 */
//- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler{
//
//    UITabBarController *tab = (UITabBarController *)self.window.rootViewController;
//
//    if ([userActivity.activityType isEqualToString:@"com.company.app.moduleA.one"]) {
//        UINavigationController *nav = tab.selectedViewController;
//
//        id<ModuleAServiceProtocol> moduleAService = [[BeeHive shareInstance] createService:@protocol(ModuleAServiceProtocol)];
//        UIViewController *one = [moduleAService getModuleAMainViewController];
//        [nav pushViewController:one animated:YES];
//
//    }else if ([userActivity.activityType isEqualToString:@"com.company.app.moduleB.one"]) {
//        UINavigationController *nav = tab.selectedViewController;
//
//        id<ModuleBServiceProtocol> moduleBService = [[BeeHive shareInstance] createService:@protocol(ModuleBServiceProtocol)];
//        UIViewController *one = [moduleBService getModuleBMainViewController];
//        [nav pushViewController:one animated:YES];
//
//    }
//    return YES;
//}


@end

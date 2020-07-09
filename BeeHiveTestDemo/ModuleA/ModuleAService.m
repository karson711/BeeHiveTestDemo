//
//  ModuleAService.m
//  BeeHiveTestDemo
//
//  Created by jikun on 2020/7/8.
//  Copyright © 2020年 jikun. All rights reserved.
//

#import "ModuleAOneViewController.h"
#import "ModuleAViewController.h"
#import "ModuleAService.h"
#import "LoginService.h"

@implementation ModuleAService

- (UIViewController *)getModuleAMainViewController{
    return [ModuleAViewController new];
}

- (void )pushToModuleAOneViewController{
    
    id<LoginServiceProtocol> loginService = [[BeeHive shareInstance] createService:@protocol(LoginServiceProtocol)];
    
    [loginService loginIfNeedWithCompleteBlock:^(BOOL isLogined) {
        if (isLogined) {
            UITabBarController *tab = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
            UINavigationController *nav = tab.selectedViewController;
            ModuleAOneViewController *one = [ModuleAOneViewController new];
            
            [nav pushViewController:one animated:YES];
        }
    }];
}

@end

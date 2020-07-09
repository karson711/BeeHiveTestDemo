//
//  ModuleBService.m
//  BeeHiveTestDemo
//
//  Created by jikun on 2020/7/8.
//  Copyright © 2020年 jikun. All rights reserved.
//

#import "ModuleBOneViewController.h"
#import "ModuleBViewController.h"
#import "ModuleBService.h"

@implementation ModuleBService

- (UIViewController *)getModuleBMainViewController{
    return [ModuleBViewController new];
}

- (void)pushToModuleBOneViewController{
    UITabBarController *tab = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    UINavigationController *nav = tab.selectedViewController;
    ModuleBOneViewController *one = [ModuleBOneViewController new];
    
    [nav pushViewController:one animated:YES];
}

@end

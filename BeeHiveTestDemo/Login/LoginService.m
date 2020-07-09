//
//  LoginService.m
//  BeeHiveTestDemo
//
//  Created by 安徽伯仲 on 2020/7/9.
//  Copyright © 2020 安徽伯仲. All rights reserved.
//

#import "LoginService.h"
#import "LoginViewController.h"

@BeeHiveService(LoginServiceProtocol,LoginService)
@implementation LoginService

-(void)loginIfNeedWithCompleteBlock:(void (^)(BOOL))completeBlock{
    BOOL hasLogined = NO;
    if (hasLogined) {
        completeBlock(YES);
        
    }else{
        
        UITabBarController *tab = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
        UINavigationController *nav = tab.selectedViewController;
        
        LoginViewController *login = [LoginViewController new];
        login.completeBlock = completeBlock;
        [nav presentViewController:login animated:YES completion:nil];
    }
}

@end

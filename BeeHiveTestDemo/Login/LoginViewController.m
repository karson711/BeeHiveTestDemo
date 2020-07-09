//
//  LoginViewController.m
//  BeeHiveTestDemo
//
//  Created by 安徽伯仲 on 2020/7/9.
//  Copyright © 2020 安徽伯仲. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    btn.center = CGPointMake(self.view.center.x, self.view.center.y+60);
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.view.backgroundColor = [UIColor redColor];
}

-(void)btnClick{
    
    if (self.completeBlock) {
        self.completeBlock(YES);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

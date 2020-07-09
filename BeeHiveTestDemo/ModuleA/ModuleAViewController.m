//
//  ModuleAViewController.m
//  BeeHiveTestDemo
//
//  Created by jikun on 2020/7/8.
//  Copyright © 2020年 jikun. All rights reserved.
//

#import "ModuleAOneViewController.h"
#import "ModuleAViewController.h"
#import "ModuleAService.h"
#import "BHService.h"

@interface ModuleAViewController ()

@end

@implementation ModuleAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:20];
    label.text = @"Module A";
    [self.view addSubview:label];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 280, 80)];
    btn.center = CGPointMake(self.view.center.x, self.view.center.y+60);
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.numberOfLines = 0;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:@"判断是否已登录，登录后再跳转ModuleAOneViewController" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

- (void)btnClick{
    id<ModuleAServiceProtocol> moduleAService = [[BeeHive shareInstance] createService:@protocol(ModuleAServiceProtocol)];
    [moduleAService pushToModuleAOneViewController];

}

@end

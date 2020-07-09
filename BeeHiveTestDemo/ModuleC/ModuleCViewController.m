//
//  ModuleCViewController.m
//  BeeHiveTestDemo
//
//  Created by jikun on 2020/7/8.
//  Copyright © 2020年 jikun. All rights reserved.
//

#import "BHService.h"
#import "ModuleCViewController.h"

//注册protocol和impClass映射关系方式三
@BeeHiveService(ModuleCServiceProtocol,ModuleCViewController)
@interface ModuleCViewController ()<ModuleCServiceProtocol>

@end

@implementation ModuleCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:20];
    label.text = @"Module C";
    [self.view addSubview:label];
}



@end

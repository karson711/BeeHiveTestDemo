//
//  ModuleAOneViewController.m
//  BeeHiveTestDemo
//
//  Created by jikun on 2020/7/8.
//  Copyright © 2020年 jikun. All rights reserved.
//

#import "ModuleAOneViewController.h"

@interface ModuleAOneViewController ()

@end

@implementation ModuleAOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:20];
    label.text = @"Module A One";
    [self.view addSubview:label];
    
    [self createUserActivity];
}

- (void)createUserActivity{
    NSUserActivity *activity = [[NSUserActivity alloc]initWithActivityType:@"com.company.app.moduleA.one"];
    activity.title = @"push to moduleA-one";
    activity.keywords = [NSSet setWithObjects:@"testA", nil];
    activity.eligibleForSearch = YES;
    activity.eligibleForHandoff = NO;
    [activity becomeCurrent];
    self.userActivity = activity;
}

@end

//
//  ModuleAService.h
//  BeeHiveTestDemo
//
//  Created by jikun on 2020/7/8.
//  Copyright © 2020年 jikun. All rights reserved.
//

#import "BHService.h"

#import <Foundation/Foundation.h>

@interface ModuleAService : NSObject<ModuleAServiceProtocol>

- (UIViewController *)getModuleAMainViewController;

- (void)pushToModuleAOneViewController;

@end

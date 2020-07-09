//
//  ModuleAModule.m
//  BeeHiveTestDemo
//
//  Created by jikun on 2020/7/8.
//  Copyright © 2020年 jikun. All rights reserved.
//

#import "ModuleAModule.h"
#import "BHService.h"

@BeeHiveMod(ModuleAModule)
@interface ModuleAModule() <BHModuleProtocol>
@end

@implementation ModuleAModule

- (void)modContinueUserActivity:(BHContext *)context{
    
    NSUserActivity *userActivity = context.userActivityItem.userActivity;
    if ([userActivity.activityType isEqualToString:@"com.company.app.moduleA.one"]) {
    
        id<ModuleAServiceProtocol> moduleAService = [[BeeHive shareInstance] createService:@protocol(ModuleAServiceProtocol)];
        [moduleAService pushToModuleAOneViewController];
    }
}

@end

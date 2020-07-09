//
//  ModuleBModule.m
//  BeeHiveTestDemo
//
//  Created by jikun on 2020/7/8.
//  Copyright © 2020年 jikun. All rights reserved.
//

#import "ModuleBModule.h"
#import "BHService.h"

@BeeHiveMod(ModuleBModule)
@interface ModuleBModule() <BHModuleProtocol>

@end

@implementation ModuleBModule

- (void)modContinueUserActivity:(BHContext *)context{
    
    NSUserActivity *userActivity = context.userActivityItem.userActivity;
   
    
    if ([userActivity.activityType isEqualToString:@"com.company.app.moduleB.one"]) {
        
        id<ModuleBServiceProtocol> moduleBService = [[BeeHive shareInstance] createService:@protocol(ModuleBServiceProtocol)];
        [moduleBService pushToModuleBOneViewController];
        
    }
}
@end

//
//  ModuleAServiceProtocol.h
//  BeeHiveTestDemo
//
//  Created by jikun on 2020/7/8.
//  Copyright © 2020年 jikun. All rights reserved.
//

#import "BHServiceProtocol.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ModuleAServiceProtocol <NSObject, BHServiceProtocol>

- (UIViewController *)getModuleAMainViewController;

- (void)pushToModuleAOneViewController;

@end

NS_ASSUME_NONNULL_END

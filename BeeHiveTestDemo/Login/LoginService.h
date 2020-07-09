//
//  LoginService.h
//  BeeHiveTestDemo
//
//  Created by 安徽伯仲 on 2020/7/9.
//  Copyright © 2020 安徽伯仲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHService.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginService : NSObject<LoginServiceProtocol>

-(void)loginIfNeedWithCompleteBlock:(void(^)(BOOL))completeBlock;

@end

NS_ASSUME_NONNULL_END

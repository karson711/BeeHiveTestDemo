//
//  LoginServiceProtocol.h
//  BeeHiveTestDemo
//
//  Created by 安徽伯仲 on 2020/7/9.
//  Copyright © 2020 安徽伯仲. All rights reserved.
//

#import "BHServiceProtocol.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LoginServiceProtocol <NSObject, BHServiceProtocol>

-(void)loginIfNeedWithCompleteBlock:(void(^)(BOOL))completeBlock;

@end

NS_ASSUME_NONNULL_END

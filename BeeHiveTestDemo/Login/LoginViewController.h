//
//  LoginViewController.h
//  BeeHiveTestDemo
//
//  Created by 安徽伯仲 on 2020/7/9.
//  Copyright © 2020 安徽伯仲. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController

@property (nonatomic, copy)  void (^completeBlock) (BOOL loigned);

@end

NS_ASSUME_NONNULL_END

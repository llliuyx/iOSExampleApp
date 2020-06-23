//
//  GTMediator.h
//  FirstExampleApp
//
//  Created by liuyx on 2020/6/23.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTDetailViewControllerProtocol <NSObject>
- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;
@end

@interface GTMediator : NSObject

// target action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

//urlscheme
typedef void (^GTMediatorProcessBlock)(NSDictionary *params);
+ (void)registerScheme: (NSString *)scheme processBlock:(GTMediatorProcessBlock) processBlock;
+ (void)openUrl: (NSString *)url params:(NSDictionary *)params;


//protocol class
+ (void)registerProtol:(Protocol *)proto class:(Class) cls;
+ (Class)classForProtol:(Protocol *)proto;

@end

NS_ASSUME_NONNULL_END


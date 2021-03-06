//
//  GTMediator.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/6/23.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "GTMediator.h"

@implementation GTMediator

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl
{
    Class detailCls = NSClassFromString(@"GTDetailViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:detailUrl];
    return controller;
}

#pragma mark -
+ (NSMutableDictionary *)mediatorCache {
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

+ (void)registerScheme: (NSString *)scheme processBlock:(GTMediatorProcessBlock) processBlock
{
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}

+ (void)openUrl: (NSString *)url params:(NSDictionary *)params
{
    GTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

+ (void)registerProtol:(Protocol *)proto class:(Class) cls
{
    if (proto && cls) {
        [[[self class] mediatorCache] setObject:cls forKey:NSStringFromProtocol(proto)];
    }
}

+ (Class)classForProtol:(Protocol *)proto
{
    return [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(proto)];
}

@end

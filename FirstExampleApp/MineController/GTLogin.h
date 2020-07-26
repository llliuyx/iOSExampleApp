//
//  GTLogin.h
//  FirstExampleApp
//
//  Created by liuyx on 2020/6/23.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GTLoginFinishBlock)(BOOL isLogin);

@interface GTLogin : NSObject

@property(nonatomic, strong, readwrite) NSString *nick;
@property(nonatomic, strong, readwrite) NSString *address;
@property(nonatomic, strong, readwrite) NSString *avatarUrl;

+(instancetype) sharedLogin;

-(BOOL) isLogin;
-(void) loginWithFinishBlock:(GTLoginFinishBlock)finishBlock;
-(void) logOut;

-(void) shareToQQWithArticlerUrl:(NSURL *) articleUrl;

@end

NS_ASSUME_NONNULL_END

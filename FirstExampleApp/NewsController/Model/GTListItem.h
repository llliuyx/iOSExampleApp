//
//  GTListItem.h
//  FirstExampleApp
//
//  Created by liuyx on 2020/5/4.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTListItem : NSObject

@property(nonatomic, strong, readwrite) NSString *category;
@property(nonatomic, strong, readwrite) NSString *picUrl;
@property(nonatomic, strong, readwrite) NSString *uniqueKey;
@property(nonatomic, strong, readwrite) NSString *title;
@property(nonatomic, strong, readwrite) NSString *date;
@property(nonatomic, strong, readwrite) NSString *authorName;
@property(nonatomic, strong, readwrite) NSString *articleUrl;

-(void) configWithDictinary:(NSDictionary *)dictinary;

@end

NS_ASSUME_NONNULL_END

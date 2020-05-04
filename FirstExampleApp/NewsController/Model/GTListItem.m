//
//  GTListItem.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/5/4.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "GTListItem.h"

@implementation GTListItem

-(void) configWithDictinary:(NSDictionary *)dictinary {
#warning 类型是否匹配
    self.category = [dictinary objectForKey:@"category"];
    self.picUrl = [dictinary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictinary objectForKey:@"uniquekey"];
    self.title = [dictinary objectForKey:@"title"];
    self.date = [dictinary objectForKey:@"date"];
    self.authorName = [dictinary objectForKey:@"author_name"];
    self.articleUrl = [dictinary objectForKey:@"url"];
}

@end

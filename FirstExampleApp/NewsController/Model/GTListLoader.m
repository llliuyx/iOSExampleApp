//
//  GTListLoader.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/5/4.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "GTListLoader.h"
#import "GTListItem.h"
#import <AFNetworking.h>

@implementation GTListLoader

-(void) loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock {
    
//    [[AFHTTPSessionManager manager] GET:@"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"");
//    }];
    
    NSString *URLString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *listURL = [NSURL URLWithString:URLString];

    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsonError;
        id jsonObj =[NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

#warning 类型检查
        NSArray *dataArray = [((NSDictionary *) [((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        
        NSMutableArray *listItemArray = @[].mutableCopy;
        
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictinary:info];
            [listItemArray addObject:listItem];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
        
    }];

    [dataTask resume];

    NSLog(@"");
    
}

@end

//
//  GTListLoader.h
//  FirstExampleApp
//
//  Created by liuyx on 2020/5/4.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GTListItem;

NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);

@interface GTListLoader : NSObject

-(void) loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END

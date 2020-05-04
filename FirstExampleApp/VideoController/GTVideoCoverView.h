//
//  GTVideoCoverView.h
//  FirstExampleApp
//
//  Created by liuyx on 2020/5/2.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverView : UICollectionViewCell

-(void)layoutWithVideoCoverUrl:(NSString *) videoCoverUrl videoUrl: (NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END

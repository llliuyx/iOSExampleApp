//
//  GTDeleteCellView.h
//  FirstExampleApp
//
//  Created by liuyx on 2020/3/14.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView
-(void) showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock;
@end

NS_ASSUME_NONNULL_END

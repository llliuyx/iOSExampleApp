//
//  GTNormalTableViewCell.h
//  FirstExampleApp
//
//  Created by liuyx on 2020/3/1.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GTListItem;

NS_ASSUME_NONNULL_BEGIN

@protocol GTNormalTableViewCellDelegate <NSObject>

- (void) tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButtion;

@end

@interface GTNormalTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;

- (void) layoutTableViewCellWithItem:(GTListItem *)item;

@end

NS_ASSUME_NONNULL_END

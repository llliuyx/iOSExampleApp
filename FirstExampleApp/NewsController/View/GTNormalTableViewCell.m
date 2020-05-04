//
//  GTNormalTableViewCell.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/3/1.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "GTNormalTableViewCell.h"
#import "GTListItem.h"

@interface GTNormalTableViewCell()

@property(nonatomic, strong, readwrite) UILabel *titleBabel;
@property(nonatomic, strong, readwrite) UILabel *sourceBabel;
@property(nonatomic, strong, readwrite) UILabel *commentBabel;
@property(nonatomic, strong, readwrite) UILabel *timeBabel;

@property(nonatomic, strong, readwrite) UIImageView *rightImageView;

@property(nonatomic, strong, readwrite) UIButton * deleteButton;

@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleBabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 50)];
//            self.titleBabel.backgroundColor = [UIColor redColor];
            self.titleBabel.font = [UIFont systemFontOfSize:16];
            self.titleBabel.textColor = [UIColor blackColor];
            self.titleBabel.numberOfLines = 2;
            self.titleBabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleBabel;
        })];
        [self.contentView addSubview:({
            self.sourceBabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 50, 20)];
//            self.sourceBabel.backgroundColor = [UIColor redColor];
            self.sourceBabel.font = [UIFont systemFontOfSize:12];
            self.sourceBabel.textColor = [UIColor grayColor];
            self.sourceBabel;
        })];
        [self.contentView addSubview:({
            self.commentBabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 50, 20)];
//            self.commentBabel.backgroundColor = [UIColor redColor];
            self.commentBabel.font = [UIFont systemFontOfSize:12];
            self.commentBabel.textColor = [UIColor grayColor];
            self.commentBabel;
        })];
        [self.contentView addSubview:({
            self.timeBabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 70, 50, 20)];
//            self.timeBabel.backgroundColor = [UIColor redColor];
            self.timeBabel.font = [UIFont systemFontOfSize:12];
            self.timeBabel.textColor = [UIColor grayColor];
            self.timeBabel;
        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 100, 70)];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];
//
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 80, 30, 20)];
//            self.deleteButton.backgroundColor = [UIColor blueColor];
//            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
//            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
//            [self.deleteButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
//
//            self.deleteButton.layer.cornerRadius = self.deleteButton.bounds.size.height / 2;
//            self.deleteButton.layer.masksToBounds = YES;
//            self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//            self.deleteButton.layer.borderWidth = 1;
//
//            self.deleteButton;
//        })];
    }
    
    return self;
}

- (void) layoutTableViewCellWithItem:(GTListItem *)item {
    self.titleBabel.text = item.title;
    
    self.sourceBabel.text = item.authorName;
    [self.sourceBabel sizeToFit];
    
    self.commentBabel.text = item.category;
    [self.commentBabel sizeToFit];
    self.commentBabel.frame = CGRectMake(self.sourceBabel.frame.origin.x + self.sourceBabel.frame.size.width + 15, self.commentBabel.frame.origin.y, self.commentBabel.frame.size.width, self.commentBabel.frame.size.height);
    
    self.timeBabel.text = item.date;
    [self.timeBabel sizeToFit];
    self.timeBabel.frame = CGRectMake(self.commentBabel.frame.origin.x + self.commentBabel.frame.size.width + 15, self.timeBabel.frame.origin.y, self.timeBabel.frame.size.width, self.timeBabel.frame.size.height);

#warning
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
    self.rightImageView.image = image;
    
//    NSThread *downloadImageThread = [[NSThread alloc] initWithBlock:^{
//
//    }];
//
//    downloadImageThread.name = @"downloadImageThread";
//    [downloadImageThread start];

//    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
//
//    dispatch_async(downloadQueue, ^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        dispatch_async(mainQueue, ^{
//            self.rightImageView.image = image;
//        });
//    });

}

-(void) deleteButtonClick {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}

@end

//
//  GTVideoCoverView.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/5/2.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "GTVideoCoverView.h"
#import "GTVideoToolBar.h"
#import <AVFoundation/AVFoundation.h>

@interface GTVideoCoverView()

@property(nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property(nonatomic, strong, readwrite) AVPlayer *avPlay;
@property(nonatomic, strong, readwrite) AVPlayerLayer *playLayer;

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, strong, readwrite) NSString *videoUrl;
@property(nonatomic, strong, readwrite) GTVideoToolBar *toolBar;

@end

@implementation GTVideoCoverView

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height - GTVideoToolBarHeight))];
            _coverView;
        })];
        [self addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:(CGRectMake((frame.size.width - 50) / 2, (frame.size.height - GTVideoToolBarHeight - 50) / 2, 50, 50))];
            _playButton;
        })];
        
        [self addSubview:({
            _toolBar = [[GTVideoToolBar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, _coverView.bounds.size.width, GTVideoToolBarHeight)];
            _toolBar;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
//        [_playButton addGestureRecognizer:tapGesture];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_videoItem removeObserver:self forKeyPath:@"status"];
}

#pragma mark - public method
-(void)layoutWithVideoCoverUrl:(NSString *) videoCoverUrl videoUrl: (NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"icon.bundle/videoPlay@3x.png"];
    _videoUrl = videoUrl;
    [_toolBar layoutWithModel:nil];
}

#pragma mark - private method
-(void) _tapToPlay {
    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    _avPlay = [AVPlayer playerWithPlayerItem:_videoItem];
    
    _playLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlay];
    
    _playLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:_playLayer];
        
}

-(void) _handlePlayEnd {
    [_playLayer removeFromSuperlayer];
    _playLayer = nil;
    _avPlay = nil;
    _videoItem = nil;
}

#pragma mark -KVO

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerStatusReadyToPlay) {
            [_avPlay play];
        } else {
            NSLog(@"");
        }
    }
}

@end

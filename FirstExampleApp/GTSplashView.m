//
//  GTSplashView.m
//  FirstExampleApp
//
//  Created by liuyx on 2020/5/4.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import "GTSplashView.h"
#import "GTScreen.h"

@interface GTSplashView()

@property(nonatomic, strong, readwrite) UIButton *button;

@end

@implementation GTSplashView

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:CGRectMake(330, 100, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

-(void) _removeSplashView {
    [self removeFromSuperview];
}

@end

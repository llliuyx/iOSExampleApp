//
//  RoundDotAnimation.h
//  转场动画Demo
//
//  Created by SKOTC on 17/6/23.
//  Copyright © 2017年 CAOMEI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RoundDotAnimation : NSObject<UIViewControllerAnimatedTransitioning,CAAnimationDelegate>


@property(nonatomic,assign) BOOL  isPresentOrDismiss;

@end

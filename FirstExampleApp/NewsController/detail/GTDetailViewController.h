//
//  GTDetailViewController.h
//  FirstExampleApp
//
//  Created by liuyx on 2020/3/14.
//  Copyright © 2020 liuyx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTDetailViewController : UIViewController<GTDetailViewControllerProtocol>

- (instancetype) initWithUrlString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
